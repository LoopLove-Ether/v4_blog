import datetime

from django.shortcuts import render, redirect

from api.models import Email
from app01.models import Articles, Tags, Cover, Advert, Avatars, UserInfo, Navs, Moods
from api.utils.permissions_control import is_super_fun
# Create your views here.
import json


# 后台
def backend(request):
    if not request.user.username:
        # 未登录
        return redirect('/')
    user = request.user
    collects_query = user.collects.all()  # 获得用户收藏的所有文章
    return render(request, 'backend/backend.html', locals())
    # 如果前端页面需要用到request中的变量的话,需要在这里进行返回


# 添加文章
@is_super_fun
def add_article(request):
    # 拿到所有的分类、标签
    category_list = Articles.category_choice
    tag_list = Tags.objects.all()

    # 拿到所有的文章封面
    cover_list = Cover.objects.all()
    c_l = []
    for cover in cover_list:
        c_l.append({
            "url": cover.url.url,
            "nid": cover.nid
        })

    return render(request, 'backend/add_article.html', locals())


# 修改头像
def edit_avatar(request):
    # 查询所有的头像
    avatar_list = Avatars.objects.all()
    # 要判断用户的注册来源(不同的来源,头像的存储位置不同)
    user = request.user
    sign_status = user.sign_status
    if sign_status == 0:
        # 用户名注册
        avatar_id = user.avatar.nid  # 用户当前的头像
    else:
        # 如果是第三方注册
        avatar_url = user.avatar_url
        for i in avatar_list:
            if i.url.url == avatar_url:
                avatar_id = i.nid
    return render(request, 'backend/edit_avatar.html', locals())


# 修改密码
def edit_password(request):
    return render(request, 'backend/edit_password.html', locals())


# 修改文章
@is_super_fun
def edit_article(request, nid):
    # 拿到所有的分类、标签
    category_list = Articles.category_choice
    tag_list = Tags.objects.all()
    # 拿到所有的文章封面
    cover_list = Cover.objects.all()
    c_l = []
    for cover in cover_list:
        c_l.append({
            "url": cover.url.url,
            "nid": cover.nid
        })

    article_obj = Articles.objects.get(nid=nid)  # 找到要修改的文章
    # 反序列化所修改的文章的标签
    tags = [str(tag.nid) for tag in article_obj.tag.all()]

    return render(request, 'backend/edit_article.html', locals())


# 头像列表
@is_super_fun
def avatar_list(request):
    avatar_query = Avatars.objects.all()  # 查询所有头像
    return render(request, 'backend/avatar_list.html', locals())


# 文章封面
@is_super_fun
def cover_list(request):
    cover_query = Cover.objects.all()
    return render(request, 'backend/cover_list.html', locals())


# admin首页
@is_super_fun
def admin_home(request):
    user_count = UserInfo.objects.count()  # 用户总数
    article_count = Articles.objects.count()  # 文章总数
    nav_count = Navs.objects.count()  # 网址总数
    link_count = Navs.objects.filter(tag__title="博客").count()  # 友链总数
    mood_count = Moods.objects.count()  # 心情总数
    # 今日注册
    now = datetime.date.today()
    today_sign = UserInfo.objects.filter(
        date_joined__gte=now  # gte 是大于等于的意思
    ).count()
    email_count = Email.objects.count()  # 发送邮件总数
    return render(request, 'admin_home.html', locals())
