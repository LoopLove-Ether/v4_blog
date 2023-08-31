import time

from django.views import View
from django.http import JsonResponse
from django import forms
from django.contrib import auth
from app01.models import Avatars, Feedback
from django.shortcuts import redirect


# 字段验证
class EditPasswordForm(forms.Form):
    old_pwd = forms.CharField(min_length=4,
                              error_messages={'required': '请输入之前的密码', 'min_length': '密码最少为4位'})
    pwd = forms.CharField(min_length=4, error_messages={'required': '请输入新密码', 'min_length': '密码最少为4位'})
    re_pwd = forms.CharField(min_length=4,
                             error_messages={'required': '请再次输入新密码', 'min_length': '密码最少为4位'})

    # 重写init方法
    def __init__(self, *args, **kwargs):
        self.request = kwargs.pop('request', None)
        super().__init__(*args, **kwargs)

    # 局部钩子
    # 验证原密码是否输入正确
    def clean_old_pwd(self):
        old_pwd = self.cleaned_data['old_pwd']
        user = auth.authenticate(username=self.request.user.username, password=old_pwd)
        # 验证不成功
        if not user:
            self.add_error('old_pwd', '旧密码输入错误!')
        return old_pwd

    # 全局钩子
    def clean(self):
        pwd = self.cleaned_data.get('pwd')
        re_pwd = self.cleaned_data.get('re_pwd')
        if pwd != re_pwd:
            self.add_error('re_pwd', '两次密码不一致')
        return self.cleaned_data


# 错误信息处理
def clean_form(form):
    err_dict: dict = form.errors
    # 拿到第一个错误的字段名字(键)
    err_valid = list(err_dict.keys())[0]
    # 拿到第一个字段的第一个错误信息
    err_msg = err_dict[err_valid][0]
    return err_valid, err_msg


# 修改密码
class EditPasswordView(View):
    def post(self, request):
        res = {
            'msg': '密码修改成功',
            'self': None,
            'code': 414,
        }
        data = request.data
        form = EditPasswordForm(data, request=request)
        # 校验不通过
        if not form.is_valid():
            res['self'], res['msg'] = clean_form(form)
            return JsonResponse(res)

        user = request.user  # User表继承自Django的auth表
        # 设置新密码
        user.set_password(data['pwd'])
        user.save()
        # 修改过密码后要退出当前的登录状态
        auth.logout(request)
        res['code'] = 0
        return JsonResponse(res)


# 修改头像
class EditAvatarView(View):
    def put(self, request):
        res = {
            'msg': '头像修改成功',
            'code': 414,
        }
        avatar_id = request.data.get('avatar_id')

        # 要判断用户的注册来源(不同的来源,头像的存储位置不同)
        user = request.user
        sign_status = user.sign_status
        avatar = Avatars.objects.get(nid=avatar_id)
        if sign_status == 0:
            # 用户名注册
            user.avatar_id = avatar_id
        else:
            avatar_url = avatar.url.url
            user.avatar_url = avatar_url
        user.save()
        res['data'] = avatar.url.url
        res['code'] = 0
        return JsonResponse(res)


# 完善信息专用的字段验证
class EditUserInfoForm(forms.Form):
    email = forms.EmailField(error_messages={'required': '请输入邮箱', 'invalid': '请输入正确的邮箱'})
    pwd = forms.CharField(error_messages={'required': '请输入密码'})
    code = forms.CharField(error_messages={'required': '请输入验证码'})

    # 重写init方法
    def __init__(self, *args, **kwargs):
        self.request = kwargs.pop('request', None)
        super().__init__(*args, **kwargs)

    # 局部钩子
    # 校验邮箱(校验最终提交的邮箱和获取验证码的邮箱是否一致)
    def clean_email(self):
        email = self.cleaned_data.get('email')
        # 判断是否和self里的邮箱相同
        if email == self.request.session.get('valid_email_obj')['email']:
            return email
        self.add_error('email', '邮箱二次校验错误')

    # 校验密码
    def clean_pwd(self):
        pwd = self.cleaned_data['pwd']
        user = auth.authenticate(username=self.request.user.username, password=pwd)
        if user:
            return pwd
        self.add_error('pwd', '密码校验错误')

    # 校验验证码
    def clean_code(self):
        code = self.cleaned_data['code']
        # 判断是否和self里的验证码相同
        if code == self.request.session.get('valid_email_obj')['code']:
            return code
        self.add_error('code', '验证码错误')


# 完善信息
class EditUserInfoView(View):
    def put(self, request):
        res = {
            'code': 332,
            'msg': '信息完善成功',
            'self': None,
        }
        # 校验时间
        # 验证码只在5分钟内有效
        valid_email_obj = request.session.get('valid_email_obj')
        # 如果没有获取验证码
        if not valid_email_obj:
            res['msg'] = '请先获取验证码'
            return JsonResponse(res)
        time_stamp = valid_email_obj['time_stamp']
        now_stamp = time.time()
        if (now_stamp - time_stamp) > 300:
            res['msg'] = '验证码已失效,请重新获取'
            return JsonResponse(res)
        form = EditUserInfoForm(request.data, request=request)
        # 校验失败
        if not form.is_valid():
            res['self'], res['msg'] = clean_form(form)
            return JsonResponse(res)

        # 绑定信息
        user = request.user
        user.email = form.cleaned_data['email']
        user.save()

        res['code'] = 0
        return JsonResponse(res)


# 取消收藏
class CancelCollection(View):
    def post(self, request):
        nid_list = request.POST.getlist('nid')
        request.user.collects.remove(*nid_list)  # 取消收藏
        return redirect('/backend/')


# 意见反馈的字段校验
class FeedBackForm(forms.Form):
    email = forms.EmailField(error_messages={'required': '请输入邮箱', 'invalid': '请输入正确的邮箱'})
    content = forms.CharField(error_messages={'required': '请输入反馈内容'})


# 意见反馈
class FeedBackView(View):
    def post(self, request):
        res = {
            'msg': '反馈成功,小叶正在给你回信',
            'code': 543,
            'self': None,
        }
        form = FeedBackForm(request.data)
        # 校验失败
        if not form.is_valid():
            res['self'], res['msg'] = clean_form(form)
            return JsonResponse(res)

        # 在反馈信息表中创建数据
        Feedback.objects.create(**form.cleaned_data)
        res['code'] = 0

        return JsonResponse(res)
