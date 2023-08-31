from django.shortcuts import render, redirect
from django.http import JsonResponse, HttpResponse
from app01.utils.random_code import random_code
from django.contrib import auth
from app01.models import UserInfo, Moods, NavTags, Navs
from app01.models import Articles, Tags, Cover, Advert, Avatars, History
from app01.utils.sub_comment import sub_comment_list
from django.db.models import F
from app01.utils.pagination import Pagination


# 主页
def index(request):
    # 针对于修改日期进行排序
    article_list = Articles.objects.filter(status=1).order_by('-change_date')  # 过滤出已发布的文章
    frontend_list = article_list.filter(category=1)[:6]  # 过滤出已发布的前端文章
    backend_list = article_list.filter(category=2)[:6]  # 过滤出已发布的后端文章

    query_params = request.GET.copy()
    pager = Pagination(
        current_page=request.GET.get('page'),
        all_count=article_list.count(),
        base_url=request.path_info,
        query_params=query_params,
        per_page=10,
        pager_page_count=7
    )
    article_list = article_list[pager.start:pager.end]

    advert_list = Advert.objects.filter(is_show=True)  # 选择已展示的广告

    cover_list = Cover.objects.all()

    link_list = Navs.objects.filter(tag__title='博客')  # 返回博客标签的文章,展示在友链区域

    online_count = len(request.online_list)  # 实时在线人数

    return render(request, 'index.html', locals())


# 全文搜索
def search(request):
    search_key = request.GET.get('key', '')
    order = request.GET.get('order', '')  # 排序方式
    tag = request.GET.get('tag', '')  # 标签筛选
    word = request.GET.getlist('word')  # 字数筛选

    query_params = request.GET.copy()

    article_list = Articles.objects.filter(title__contains=search_key)

    # 字数搜索
    if len(word) == 2:
        article_list = article_list.filter(word__range=word)
    # 标签搜索
    if tag:
        article_list = article_list.filter(tag__title=tag)  # 多对多

    if order:
        try:
            article_list = article_list.order_by(order)
        except Exception:
            pass

    # 分页器
    pager = Pagination(
        current_page=request.GET.get('page'),
        all_count=article_list.count(),
        base_url=request.path_info,
        query_params=query_params,
        per_page=5,
        pager_page_count=7
    )
    article_list = article_list[pager.start:pager.end]

    # 文章筛选条件
    query_params.urlencode()  # 对参数字段进行url编码

    return render(request, 'search.html', locals())


# 文章详情页
def article(request, nid):
    article_query = Articles.objects.filter(nid=nid)

    article_query.update(look_count=F('look_count') + 1)
    # 查无此文章时返回首页
    if not article_query:
        return redirect('/')
    article_obj = article_query.first()  # 找到第一篇文章
    comment_list = sub_comment_list(nid)  # 评论列表

    if article_obj.pwd:
        # 读取session中的数据
        pwd = request.session.get(f'article_pwd__{nid}')
        if pwd == article_obj.pwd:
            # 已经输入了成功的密码
            return render(request, 'article.html', locals())

        return render(request, 'article_lock.html', locals())

    return render(request, 'article.html', locals())  # locals()就是把所有的内容传递给前端


# 新闻
def news(request):
    return render(request, 'news.html')


# 关于页
def about(request):
    # 编号47的关于文章
    article_query = Articles.objects.filter(nid=47)

    article_query.update(look_count=F('look_count') + 1)  # 文章浏览量+1
    # 出现错误找不到文章
    if not article_query:
        return redirect('/')
    article_obj = article_query.first()
    comment_list = sub_comment_list(47)

    return render(request, 'about.html', locals())


# 心情
def moods(request):
    # 查询所有的头像
    avatar_list = Avatars.objects.all()

    # 搜索
    key = request.GET.get('key', '')
    mood_list = Moods.objects.filter(content__contains=key).order_by('-create_date')

    # 分页器
    query_params = request.GET.copy()

    pager = Pagination(
        current_page=request.GET.get('page'),
        all_count=mood_list.count(),
        base_url=request.path_info,
        query_params=query_params,
        per_page=5,
        pager_page_count=7
    )
    mood_list = mood_list[pager.start:pager.end]

    return render(request, 'moods.html', locals())


# 回忆录
def history(request):
    history_list = History.objects.all().order_by('-create_date')
    return render(request, 'history.html', locals())


# 网站导航
def site(request):
    # 获取所有的标签
    tag_all = NavTags.objects.all()
    # 取所有被使用的标签
    tag_list = tag_all.exclude(navs__isnull=True)
    return render(request, 'site.html', locals())


# 登录
def login(request):
    return render(request, 'login.html')


# 注册
def sign(request):
    return render(request, 'sign.html')


# 图片验证码
def get_random_code(request):
    data, valid_code = random_code()
    request.session['valid_code'] = valid_code
    request.session['error_count'] = 0  # 在session中记录用户校验失败的错误次数

    return HttpResponse(data)


# 注销
def logout(request):
    auth.logout(request)
    # 注销后重定向到主页面
    return redirect('/')
