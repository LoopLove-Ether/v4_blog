from django import forms
from django.contrib import auth
from django.http import JsonResponse
from app01.models import UserInfo, Avatars
from django.views import View
import random


class LoginBaseForm(forms.Form):
    # 默认是为空的字段验证
    # 通过error_messages参数配置错误信息
    name = forms.CharField(error_messages={'required': '请输入用户名'})
    pwd = forms.CharField(error_messages={'required': '请输入密码'})
    code = forms.CharField(error_messages={'required': '请输入验证码'})

    # 重写__init__方法
    def __init__(self, *args, **kwargs):
        self.request = kwargs.pop('request', None)
        super().__init__(*args, **kwargs)

    # 局部钩子
    def clean_code(self):
        code: str = self.cleaned_data.get('code')
        valid_code: str = self.request.session.get('valid_code')
        if code.upper() != valid_code.upper():
            self.add_error('code', '验证码输入错误')
        return self.cleaned_data


# 登录字段验证
# 这个类所需的参数就是我们要验证的数据
class LoginForm(LoginBaseForm):
    # 全局钩子
    def clean(self):
        name = self.cleaned_data.get('name')
        pwd = self.cleaned_data.get('pwd')

        # 验证用户名和密码
        user = auth.authenticate(username=name, password=pwd)
        error_count = self.request.session.get('error_count', 0)  # 用户校验失败的次数

        if error_count >= 3:
            self.add_error('name', '错误过多,请重新获取验证码')
            return None

        # 用户校验失败
        if not user:
            error_count += 1
            self.request.session['error_count'] = error_count
            self.add_error('name', '用户名或密码错误')
            return self.cleaned_data

        # 把用户对象放到cleaned_data中
        self.cleaned_data['user'] = user
        return self.cleaned_data


# 注册字段验证
class SignForm(LoginBaseForm):
    re_pwd = forms.CharField(error_messages={'required': '请输入确认密码'})

    # 全局钩子--校验密码
    def clean(self):
        pwd = self.cleaned_data.get('pwd')  # 密码
        re_pwd = self.cleaned_data.get('re_pwd')  # 确认密码
        if pwd != re_pwd:
            self.add_error('re_pwd', '两次密码不一致')
        return self.cleaned_data

    # 局部钩子--校验用户名
    def clean_name(self):
        name = self.cleaned_data.get('name')
        user_query = UserInfo.objects.filter(username=name)
        if user_query:
            self.add_error('name', '用户名已存在!')
        return self.cleaned_data


# 错误信息处理
def clean_form(form):
    err_dict: dict = form.errors
    # 拿到第一个错误的字段名字(键)
    err_valid = list(err_dict.keys())[0]
    # 拿到第一个字段的第一个错误信息
    err_msg = err_dict[err_valid][0]
    return err_valid, err_msg


# 登录
class LoginView(View):
    def post(self, request):
        # res是点击登录后返回给前端的数据
        res = {
            'code': 425,  # 状态码
            'msg': "登录成功!",  # 前端的提示消息
            'self': None  # 验证失败的字段名字
        }
        form = LoginForm(request.data, request=request)
        if not form.is_valid():
            # 验证不通过
            res['self'], res['msg'] = clean_form(form)
            return JsonResponse(res)
        # 执行登录操作
        user = form.cleaned_data.get('user')
        auth.login(request, user)  # 登录
        res['code'] = 0
        return JsonResponse(res)


# 注册
class SignView(View):
    def post(self, request):
        # res是点击登录后返回给前端的数据
        res = {
            'code': 425,  # 状态码
            'msg': "注册成功!",  # 前端的提示消息
            'self': None  # 验证失败的字段名字
        }
        form = SignForm(request.data, request=request)
        if not form.is_valid():
            # 验证不通过
            res['self'], res['msg'] = clean_form(form)
            return JsonResponse(res)
        # 注册成功
        user = UserInfo.objects.create_user(
            username=request.data.get('name'),
            password=request.data.get('pwd')
        )
        # 随机选择头像
        avatar_list = [i.nid for i in Avatars.objects.all()]
        user.avatar_id = random.choice(avatar_list)
        user.save()

        res['code'] = 0
        # 自动登录
        auth.login(request, user)

        return JsonResponse(res)
