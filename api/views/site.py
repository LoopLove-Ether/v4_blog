from django.views import View
from django.http import JsonResponse
from app01.models import Navs, NavTags
from django import forms
import datetime
from django.db.models import F
import time


class NavTagsView(View):
    def post(self, request, **kwargs):
        res = {
            'msg': '标签添加成功!',
            'code': 442,
            'self': None,
        }
        if not request.user.is_superuser:
            res['msg'] = '用户验证失败'
            return JsonResponse(res)
        title = request.data.get('title')
        if not title:
            res['msg'] = '请输入标签名'
            return JsonResponse(res)

        nid = kwargs.get('nid')
        # 添加标签
        if not nid:
            # 标签如果存在就不再添加了
            tag_query = NavTags.objects.filter(title=title)
            if tag_query:
                res['msg'] = '该标签已存在'
                return JsonResponse(res)

            NavTags.objects.create(title=title)  # 创建标签
            res['code'] = 0
            return JsonResponse(res)
        # 编辑标签
        tag_query = NavTags.objects.filter(nid=nid)
        tag_query.update(title=title)
        res['code'] = 0
        res['msg'] = '标签编辑成功'
        return JsonResponse(res)

    def delete(self, request, nid):
        res = {
            'msg': '标签删除成功',
            'code': 442,
            'self': None,
        }
        if not request.user.is_superuser:
            res['msg'] = '用户验证失败'
            return JsonResponse(res)
        tag_query = NavTags.objects.filter(nid=nid)
        if tag_query:
            tag_query.delete()
        res['code'] = 0
        return JsonResponse(res)


class NavForm(forms.Form):
    title = forms.CharField(min_length=3,
                            error_messages={'required': '请输入网站标题', 'min-length': '网站标题小于4字符'})
    abstract = forms.CharField(min_length=6,
                               error_messages={'required': '请输入网站简介', 'min-length': '网站标题小于6字符'})
    href = forms.URLField(error_messages={'required': '请输入网站链接'})
    icon_href = forms.URLField(error_messages={'required': '请输入网站图标在线链接'})
    # 用户上传的网站状态为 0 待审核，超级管理员上传的网站状态为 1 已通过
    status = forms.IntegerField(required=False)

    # 重写init方法
    def __init__(self, *args, **kwargs):
        self.request = kwargs.pop('request', None)
        self.add_or_edit = kwargs.pop('add_or_edit', True)  # 默认是添加
        super().__init__(*args, **kwargs)

    # 局部钩子,网站标题不可重复
    def clean_title(self):
        title = self.cleaned_data['title']
        nav_query = Navs.objects.filter(title=title)
        if self.add_or_edit:
            if nav_query:
                self.add_error('title', '该网站标题已存在')
        return title

    # 校验状态码
    def clean_status(self):
        status = 0
        if self.request.user.is_superuser:
            # 超级管理员
            status = 1
        return status


# 错误信息处理
def clean_form(form):
    err_dict: dict = form.errors
    # 拿到第一个错误的字段名字(键)
    err_valid = list(err_dict.keys())[0]
    # 拿到第一个字段的第一个错误信息
    err_msg = err_dict[err_valid][0]
    return err_valid, err_msg


class NavView(View):
    def get(self, request):
        title = request.GET.get('title')
        order = request.GET.get('order')
        data = []

        # 判断用户是否登录,只有登录的用户才可以拿到收藏列表,否则会报错
        if request.user.is_authenticated:
            nav_col_list = request.user.navs.all()  # 拿到用户所有的收藏列表
        else:
            nav_col_list = []

        if title == '我的收藏' and request.user.is_authenticated:
            # 获得用户所有的收藏列表
            nav_list = request.user.navs.all().order_by(f"-{order}")
        else:
            nav_list = Navs.objects.filter(tag__title=title, status=1).order_by(f"-{order}")
        for nav in nav_list:
            data.append({
                "nid": nav.nid,
                "title": nav.title,
                "abstract": nav.abstract,
                "href": nav.href,
                "icon_href": nav.icon_href,
                "create_date": nav.create_date.strftime("%Y-%m-%d"),
                "collects_count": nav.collects_count,
                "digg_count": nav.digg_count,
                "tags": [{
                    "nid": tag.nid,
                    "title": tag.title
                } for tag in nav.tag.all()],
                "is_coll": 'show' if nav in nav_col_list else '',  # 塞恩表达式?
            })
        return JsonResponse(data, safe=False)  # 返回列表要添加安全字符串

    def post(self, request):
        res = {
            'msg': '网站添加成功',
            'code': 442,
            'self': None,
        }
        data = request.data

        form = NavForm(data, request=request)
        if not form.is_valid():
            res['self'], res['msg'] = clean_form(form)
            return JsonResponse(res)
        # 在数据库中添加网站
        obj = Navs.objects.create(**form.cleaned_data)

        # 添加标签(标签是多对多,相对比较麻烦)
        tag = data.get('tag')
        if tag:
            obj.tag.add(*tag)

        if not request.user.is_superuser:
            res['msg'] = '感谢添加,管理员正在审核'

        res['code'] = 0
        return JsonResponse(res)

    def put(self, request, nid):
        res = {
            'msg': '网站编辑成功',
            'code': 442,
            'self': None,
        }
        if not request.user.is_superuser:
            res['msg'] = '用户验证失败'
            return JsonResponse(res)
        data = request.data

        form = NavForm(data, request=request, add_or_edit=False)
        if not form.is_valid():
            res['self'], res['msg'] = clean_form(form)
            return JsonResponse(res)
        # 在数据库表中进行编辑
        nav_query = Navs.objects.filter(nid=nid)
        nav_query.update(**form.cleaned_data)

        tag = data.get('tag')
        obj = nav_query.first()
        # 对于标签的编辑是先删除原来的,然后把新的添加上去
        obj.tag.clear()
        if tag:
            obj.tag.add(*tag)
        res['code'] = 0
        return JsonResponse(res)

    def delete(self, request, nid):
        res = {
            'msg': '网站删除成功',
            'code': 442,
        }
        if not request.user.is_superuser:
            res['msg'] = '用户验证失败'
            return JsonResponse(res)
        nav_query = Navs.objects.filter(nid=nid)
        nav_query.delete()
        res['code'] = 0
        return JsonResponse(res)


class NavDiggView(View):
    def post(self, request, nid):
        res = {
            'msg': '点赞+1',
            'code': 442,
            "self": None,
        }
        before_time = request.session.get(f'site_{nid}', 0)

        # 利用时间来给点赞限流
        now = int(time.time())  # 当前时间戳
        if (now - before_time) < 5:
            res['msg'] = '点赞太频繁了,休息一会儿吧'
            return JsonResponse(res)

        request.session[f'site_{nid}'] = now

        # 更新网站的点赞量
        Navs.objects.filter(nid=nid).update(digg_count=F("digg_count") + 1)
        res['code'] = 0
        return JsonResponse(res)


# 网站收藏
class NavCollectsView(View):
    def post(self, request, nid):
        # 一个用户只能收藏一次文章
        # 判断登录
        # 同样的请求,收藏变取消收藏
        res = {
            'msg': '网站收藏成功',
            'code': 412,
            'isCollects': True,  # 是否已收藏
        }
        if not request.user.username:
            res['msg'] = '请登录'
            return JsonResponse(res)
        # 判断用户是否已经收藏过该网站
        flag = request.user.navs.filter(nid=nid)
        num = 1  # 用于控制收藏数
        res['code'] = 0  # 取消收藏和收藏都是正确的
        if flag:
            # 说明用户已经收藏了该网站,要取消收藏
            res['msg'] = '取消收藏成功!'
            res['isCollects'] = False
            request.user.navs.remove(nid)
            num = -1
        else:
            # 说明用户还未收藏该网站,要进行收藏
            request.user.navs.add(nid)

        res['data'] = num
        nav_query = Navs.objects.filter(nid=nid)
        nav_query.update(collects_count=F('collects_count') + num)
        return JsonResponse(res)


# 友链
class FriendLinks(View):
    def post(self, request):
        res = {
            'msg': '友链添加成功',
            'code': 442,
            'self': None,
        }
        data = request.data

        form = NavForm(data, request=request)
        if not form.is_valid():
            res['self'], res['msg'] = clean_form(form)
            return JsonResponse(res)

        # 在网站导航数据库表中添加友链
        obj = Navs.objects.create(**form.cleaned_data)

        # 添加友链默认标签
        nav_tag = NavTags.objects.get(title='博客')
        obj.tag.add(nav_tag.nid)

        if not request.user.is_superuser:
            res['msg'] = '友链添加成功,管理员正在审核'

        res['code'] = 0
        return JsonResponse(res)
