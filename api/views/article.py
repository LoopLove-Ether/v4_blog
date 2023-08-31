import random

from django.views import View
from django.http import JsonResponse
from markdown import markdown
from pyquery import PyQuery
from app01.models import Tags, Articles, Cover
from django import forms
from django.db.models import F
from api.utils.permissions_control import is_super_method



# 添加文章或编辑文章需要验证的文章字段
class AddArticleForm(forms.Form):
    # 通过error_messages参数配置错误信息
    # 默认验证(字段是否为空)
    title = forms.CharField(error_messages={'required': '请输入文章标题'})
    author = forms.CharField(error_messages={'required': '请输入文章作者'})
    source = forms.CharField(error_messages={'required': '请输入文章来源'})
    content = forms.CharField(error_messages={'required': '请输入文章内容'})
    abstract = forms.CharField(required=False)  # 不进行默认验证
    cover_id = forms.IntegerField(required=False)  # 不进行默认验证

    category = forms.IntegerField(required=False)  # 不进行默认验证
    pwd = forms.CharField(required=False)  # 不进行默认验证
    recommend = forms.BooleanField(required=False)
    status = forms.IntegerField(required=False)

    # 个性化验证(一般要用到局部钩子)
    # 文章简介
    def clean_abstract(self):
        abstract = self.cleaned_data['abstract']
        if abstract:
            return abstract
        # 截取正文的前30个字符
        content = self.cleaned_data.get('content')
        if content:
            abstract = PyQuery(markdown(content)).text()[:90]
            return abstract

    # 文章封面
    def clean_cover_id(self):
        cover_id = self.cleaned_data['cover_id']
        if cover_id:
            return cover_id
        # 如果没有选择封面,随机分配一个
        cover_set = Cover.objects.all().values('nid')
        cover_id = random.choice(cover_set)['nid']
        return cover_id


# 错误信息处理
def clean_form(form):
    err_dict: dict = form.errors
    # 拿到第一个错误的字段名字(键)
    err_valid = list(err_dict.keys())[0]
    # 拿到第一个字段的第一个错误信息
    err_msg = err_dict[err_valid][0]
    return err_valid, err_msg


# 给文章添加标签
def add_article_tags(tags, article_obj):
    # 非空列表
    for tag in tags:
        # 传入了数据库中没有的标签
        if not tag.isdigit():
            tag_obj = Tags.objects.create(title=tag)  # 先在Tags数据库中创建新标签
            article_obj.tag.add(tag_obj)  # 在新文章中关联标签
        # 传入的标签数据库中都有
        else:
            article_obj.tag.add(tag)  # 在新文章中关联标签


# 文章
class ArticleView(View):
    # 添加文章
    @is_super_method
    def post(self, request):
        # res就是在构造返回的内容
        res = {
            'msg': '文章发布成功!',
            'code': 412,
            'data': None  # 文章id
        }
        data = request.data
        data['status'] = 1  # 文章的保存状态
        form = AddArticleForm(data)
        # forms字段出现空
        if not form.is_valid():
            # 字段验证不通过
            res['self'], res['msg'] = clean_form(form)
            return JsonResponse(res)
        # 校验通过(可以开始向数据库中写入内容了)
        article_obj = Articles.objects.create(**form.cleaned_data)  # 拆包赋值
        tags = data.get('tags')
        # 添加标签
        add_article_tags(tags, article_obj)

        res['code'] = 0
        res['data'] = article_obj.nid
        return JsonResponse(res)

    # 编辑文章
    @is_super_method
    def put(self, request, nid):
        res = {
            'msg': '文章修改成功!',
            'code': 412,
            'data': None  # 文章id
        }
        article_query = Articles.objects.filter(nid=nid)
        if not article_query:
            res['msg'] = '请求错误,查无此文章'
            return JsonResponse(res)
        data = request.data
        data['status'] = 1  # 文章的保存状态

        form = AddArticleForm(data)
        # forms字段出现空
        if not form.is_valid():
            # 字段验证不通过
            res['self'], res['msg'] = clean_form(form)
            return JsonResponse(res)
        # 校验通过(可以开始修改数据库中的内容了)
        article_query.update(**form.cleaned_data)  # 拆包赋值

        tags = data.get('tags')
        # 标签修改
        article_query.first().tag.clear()  # 清空文章原有标签
        # 添加标签
        add_article_tags(tags, article_query.first())

        res['code'] = 0
        res['data'] = article_query.first().nid
        return JsonResponse(res)


# 文章点赞
class AtricleDiggView(View):
    def post(self, request, nid):
        # 这个nid是文章id
        res = {
            'msg': '点赞成功',
            'code': 412,
            'data': 0,
        }
        if not request.user.username:
            res['msg'] = '请登录'
            return JsonResponse(res)
        comment_query = Articles.objects.filter(nid=nid)
        comment_query.update(digg_count=F('digg_count') + 1)  # 更新评论表中的点赞数据

        digg_count = comment_query.first().digg_count  # 拿到评论的点赞数

        res['code'] = 0
        res['data'] = digg_count
        return JsonResponse(res)


# 文章收藏
class ArticleCollectsView(View):
    def post(self, request, nid):
        # 一个用户只能收藏一次文章
        # 判断登录
        # 同样的请求,收藏变取消收藏
        res = {
            'msg': '文章收藏成功',
            'code': 412,
            'isCollects': True,  # 是否已收藏
            'data': 0,
        }
        if not request.user.username:
            res['msg'] = '请登录'
            return JsonResponse(res)
        # 判断用户是否已经收藏过该文章
        flag = request.user.collects.filter(nid=nid)
        num = 1
        res['code'] = 0  # 取消收藏和收藏都是正确的
        if flag:
            # 说明用户已经收藏了该文章,要取消收藏
            res['msg'] = '文章取消收藏成功!'
            res['isCollects'] = False
            request.user.collects.remove(nid)
            num = -1
        else:
            # 说明用户还未收藏该文章,要进行收藏
            request.user.collects.add(nid)

        article_query = Articles.objects.filter(nid=nid)
        article_query.update(collects_count=F('collects_count') + num)
        collects_count = article_query.first().collects_count  # 收藏数
        res['data'] = collects_count
        return JsonResponse(res)


# 查看加密文章
class ArticlePwdView(View):
    def post(self, request, nid):
        res = {
            'msg': '文章密码输入正确',
            "code": 444,
        }
        pwd = request.data.get('pwd')  # 前端用户输入的密码
        article_query = Articles.objects.filter(nid=nid)
        if not article_query:
            res['msg'] = '请求错误'
            return JsonResponse(res)
        article_obj = article_query.first()
        # 数据库中存储的密码
        if article_obj.pwd != pwd:
            res['msg'] = '文章密码输入错误'
            return JsonResponse(res)
        # 能走到这里,说明密码是正确的
        request.session[f'article_pwd__{nid}'] = pwd  # 将用户输入的密码存入session中
        res['code'] = 0
        return JsonResponse(res)


# 修改文章封面
class EditArticleCoverView(View):
    @is_super_method
    def post(self, request, nid):
        # 后端用户验证
        if not request.user.is_superuser:
            return JsonResponse({})
        cid = request.data.get('nid')  # 封面id
        Articles.objects.filter(nid=nid).update(cover_id=cid)  # 更改相应文章的封面

        return JsonResponse({})
