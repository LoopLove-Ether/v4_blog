from django.views import View
from django.http import JsonResponse
from app01.models import Avatars, Cover, UserInfo, History
from django import forms
import datetime


# 字段校验
class HistoryForm(forms.Form):
    title = forms.CharField(error_messages={'required': '请输入事件标题'})
    content = forms.CharField(error_messages={'required': '请输入事件内容'})
    create_date = forms.CharField(required=False)  # 不进行为空验证
    drawing = forms.CharField(required=False)

    # 局部钩子 校验日期
    def clean_create_date(self):
        create_date = self.cleaned_data['create_date']
        if not create_date:
            create_date = datetime.date.today()
            return create_date
        # 将字符串转为时间
        date = datetime.datetime.strptime(create_date.split('T')[0], '%Y-%m-%d').date()
        return date


# 错误信息处理
def clean_form(form):
    err_dict: dict = form.errors
    # 拿到第一个错误的字段名字(键)
    err_valid = list(err_dict.keys())[0]
    # 拿到第一个字段的第一个错误信息
    err_msg = err_dict[err_valid][0]
    return err_valid, err_msg


# 添加记录
class HistoryView(View):
    def post(self, request, **kwargs):
        # res构造返回的内容
        res = {
            'msg': '记录发布成功!',
            'code': 412,
            "self": None,
        }
        if not request.user.is_superuser:
            res['msg'] = '用户验证失败'
            return JsonResponse(res)
        data = request.data
        form = HistoryForm(data)
        # forms字段出现空
        if not form.is_valid():
            # 字段验证不通过
            res['self'], res['msg'] = clean_form(form)
            return JsonResponse(res)
        res['code'] = 0
        nid = kwargs.get('nid')
        if nid:
            # 编辑记录
            history_query = History.objects.filter(nid=nid)
            history_query.update(**form.cleaned_data)
            res['msg'] = '记录编辑成功'
            return JsonResponse(res)
        # 添加记录
        # 在路线图历史数据库中添加记录
        History.objects.create(**form.cleaned_data)
        return JsonResponse(res)

    def delete(self, request, nid):
        # res构造返回的内容
        res = {
            'msg': '记录删除成功!',
            'code': 412,
        }
        if not request.user.is_superuser:
            res['msg'] = '用户验证失败'
            return JsonResponse(res)
        history_query = History.objects.filter(nid=nid)
        history_query.delete()
        res['code'] = 0
        return JsonResponse(res)
