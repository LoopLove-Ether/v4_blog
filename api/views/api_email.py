import random
import time
from threading import Thread  # 异步执行

from django import forms
from v4_blog import settings
from django.core.handlers.wsgi import WSGIRequest  # 导入request的类,就可以使用代码提示了
from django.core.mail import send_mail
from django.http import JsonResponse
from django.views import View
from app01.models import UserInfo
from api.models import Email


# 邮箱校验
class EmailForm(forms.Form):
    # 为空校验
    email = forms.EmailField(error_messages={'required': '请输入邮箱', 'invalid': '请输入正确的邮箱'})

    # 局部钩子
    # 邮箱不可以重复绑定
    def clean_email(self):
        email = self.cleaned_data['email']
        user = UserInfo.objects.filter(email=email)
        if user:
            self.add_error('email', '该邮箱已被人注册')
        return email


# 错误信息处理
def clean_form(form):
    err_dict: dict = form.errors
    # 拿到第一个错误的字段名字(键)
    err_valid = list(err_dict.keys())[0]
    # 拿到第一个字段的第一个错误信息
    err_msg = err_dict[err_valid][0]
    return err_valid, err_msg


class ApiEmail(View):
    def post(self, request: WSGIRequest):
        res = {
            'code': 333,
            'msg': '验证码获取成功',
            'self': None
        }
        form = EmailForm(request.data)
        # 校验失败
        if not form.is_valid():
            res['self'], res['msg'] = clean_form(form)
            return JsonResponse(res)
        # 校验成功,发送邮箱,设置超时时间
        # 在session中读取(要求必须超过1分钟才可以再次发送邮件)
        valid_email_obj = request.session.get('valid_email_obj')  # Django会直接对数据进行反序列化
        if valid_email_obj:
            time_stamp = valid_email_obj['time_stamp']  # 上次发送验证码的时间戳
            # 和当前的时间戳进行比较
            now_stamp = time.time()  # 当前的时间戳
            if (now_stamp - time_stamp) < 60:
                res['msg'] = '请求过于频繁'
                return JsonResponse(res)

        # 生成验证码
        valid_email_code = ''.join(random.sample('0123456789', 6))
        # 将验证码放在session中便于后期验证
        request.session['valid_email_obj'] = {
            'code': valid_email_code,
            'time_stamp': time.time(),
            'email': form.cleaned_data.get('email')
        }

        # send_email是耗时操作,可以通过异步执行来减少耗时
        # Tread执行多线程
        # target是函数名
        # args是参数元组
        Thread(target=send_mail, args=(
            '[小叶博客]请完善你的信息!',  # 邮件标题
            f'[小叶博客]你现在正在绑定邮箱,邮箱验证码为 {valid_email_code},验证码有效期为5分钟',  # 邮件内容
            settings.EMAIL_HOST_USER,  # 发件人
            [form.cleaned_data.get('email')],  # 收件人
            False  # 校验
        )).start()
        # 更新发送邮件数目
        Email.objects.create(
            email=form.cleaned_data.get('email'),
            content='完善信息'
        )

        res['code'] = 0
        return JsonResponse(res)
