from django.views import View
from django.http import JsonResponse
from django import forms
from django.db.models import F
from app01.models import Avatars, Moods, MoodComment
import random
from api.utils.get_user_info import get_ip, get_addr_info


# 需要验证的心情字段
class AddMoodsForm(forms.Form):
    # 通过error_messages参数配置错误信息
    # 默认验证(字段是否为空)
    name = forms.CharField(error_messages={'required': '请输入用户名'})
    content = forms.CharField(error_messages={'required': '请输入发布内容'})
    avatar_id = forms.CharField(required=False)  # 不进行默认验证
    drawing = forms.CharField(required=False)  # 不进行默认验证

    # 局部钩子,如果没有选头像的话,随机给用户指定一个
    def clean_avatar_id(self):
        avatar_id = self.cleaned_data.get('avatar_id')
        if avatar_id:
            return avatar_id
        # 随机选择
        avatar_list = [i.nid for i in Avatars.objects.all()]
        avatar_id = random.choice(avatar_list)
        return avatar_id


# 错误信息处理
def clean_form(form):
    err_dict: dict = form.errors
    # 拿到第一个错误的字段名字(键)
    err_valid = list(err_dict.keys())[0]
    # 拿到第一个字段的第一个错误信息
    err_msg = err_dict[err_valid][0]
    return err_valid, err_msg

# 点赞
def mood_digg(model_obj,nid):
    res = {
        'msg': '点赞成功',
        'code': 412,
    }
    mood_query = model_obj.objects.filter(nid=nid)
    mood_query.update(digg_count=F('digg_count') + 1)
    res['data'] = mood_query.first().digg_count
    res['code'] = 0
    return JsonResponse(res)

class MoodsView(View):
    def post(self, request):
        # res构造返回的内容
        res = {
            'msg': '心情发布成功!',
            'code': 412,
            "self": None,
        }
        data = request.data
        form = AddMoodsForm(data)
        # forms字段出现空
        if not form.is_valid():
            # 字段验证不通过
            res['self'], res['msg'] = clean_form(form)
            return JsonResponse(res)

        ip = get_ip(request)  # 获得用户IP
        addr = get_addr_info(ip)  # 获得用户地址
        form.cleaned_data['ip'] = ip
        form.cleaned_data['addr'] = addr

        # 校验通过(可以开始向数据库中写入内容了)
        Moods.objects.create(**form.cleaned_data)
        res['code'] = 0
        return JsonResponse(res)

    def delete(self, request, nid):
        res = {
            'msg': '心情删除成功!',
            'code': 412,
        }
        if not request.user.is_superuser:
            # 不能删除
            res['msg'] = '用户验证失败'
            return JsonResponse(res)
        mood_query = Moods.objects.filter(nid=nid)
        if not mood_query:
            res['msg'] = '该心情不存在'
            return JsonResponse(res)
        # 在数据库中删除
        mood_query.delete()
        res['code'] = 0
        return JsonResponse(res)

    def put(self, request, nid):
        return mood_digg(Moods,nid)


class MoodCommentsView(View):
    def post(self, request, nid):
        # res构造返回的内容
        res = {
            'msg': '心情评论成功!',
            'code': 412,
            "self": None,
        }
        data = request.data
        form = AddMoodsForm(data)
        # forms字段出现空
        if not form.is_valid():
            # 字段验证不通过
            res['self'], res['msg'] = clean_form(form)
            return JsonResponse(res)

        ip = get_ip(request)  # 获得用户IP
        addr = get_addr_info(ip)  # 获得用户地址
        form.cleaned_data['ip'] = ip
        form.cleaned_data['addr'] = addr
        form.cleaned_data['mood_id'] = nid
        form.cleaned_data.pop('drawing')

        # 校验通过(可以开始向数据库中写入内容了)
        MoodComment.objects.create(**form.cleaned_data)
        # 每发布一条回复,便在心情表的评论数字段+1
        Moods.objects.filter(nid=nid).update(comment_count=F('comment_count') + 1)
        res['code'] = 0
        return JsonResponse(res)

    def delete(self, request, nid):
        # res构造返回的内容
        res = {
            'msg': '评论删除成功!',
            'code': 412,
            "data": 0
        }
        if not request.user.is_superuser:
            # 不能删除
            res['msg'] = '用户验证失败'
            return JsonResponse(res)
        mood_id = request.data.get('mood_id')  # 心情id
        MoodComment.objects.filter(nid=nid).delete()  # 删除对应id的评论

        mood_query = Moods.objects.filter(nid=mood_id)
        # 心情表的评论数字段-1
        mood_query.update(comment_count=F('comment_count') - 1)
        res['data'] = mood_query.first().comment_count  # 查询评论数
        res['code'] = 0
        return JsonResponse(res)

    def put(self, request, nid):
        return mood_digg(MoodComment,nid)


