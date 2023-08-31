import datetime
import pendulum
from django import template
from django.utils.safestring import mark_safe

from app01.models import Avatars, Cover, Advert, Tags, UserInfo

register = template.Library()


# 自定义过滤器
# 判断当前用户是否收藏了这篇文章
# 需要文章对象和登录对象两个参数
@register.filter
def is_user_collects(article, request):
    # 避免未登录用户无法访问文章
    if str(request.user) == 'AnonymousUser':
        # 没有登录
        return ''
    if article in request.user.collects.all():
        return 'show'
    return ''


# 判断是否有文章内容
@register.filter
def is_article_list(article_list):
    if len(article_list):
        return 'search_content'
    return 'no_content'


# 时间格式化
@register.filter
def date_humaniz(date: datetime.datetime):
    pendulum.set_locale('zh')  # 设置pendulum的时区
    tz = pendulum.now().tz  # 显示用户当前的时区
    # 自动计算出date和用户当前的时间相差多少
    time_difference = pendulum.parse(date.strftime('%Y-%m-%d %H:%M:%S'), tz=tz).diff_for_humans()
    return time_difference


# 统计所有正在使用的头像#
@register.filter
def to_calculate_avatar(avatar: Avatars):
    count = avatar.moodcomment_set.count() + avatar.moods_set.count() + avatar.userinfo_set.count()
    # 头像正在使用
    if count:
        return ''
    # 头像未被使用
    return 'no_avatar'


# 统计所有正在使用的封面#
@register.filter
def to_calculate_cover(cover: Cover):
    count = cover.articles_set.count()
    # 封面正在使用
    if count:
        return ''
    # 封面未被使用
    return 'no_cover'


@register.filter
def get_tags(tag_list):
    return mark_safe(''.join([f"<i>{i.title}</i>" for i in tag_list]))


# 用户收藏的文章id列表(用于全选时绑定属性)
@register.filter
def get_coll_nid(lis):
    return [i.nid for i in lis]


# 生成广告
@register.filter
def generate_advert(adv_list):
    lis = []  # 返回值列表
    # 构造出每个广告
    for i in adv_list:
        item = {}
        # 单图
        if i.img:
            item['url'] = i.img.url
            item['title'] = i.title
            item['href'] = i.href
            lis.append(item)
        # 图片组
        else:
            # 对图片组进行分号和换行符的过滤
            html_s = i.img_list
            html_new = html_s.replace("；", ";").replace('\n', ';')
            img_list = html_new.split(';')
            for u in img_list:
                item['url'] = u
                item['title'] = i.title
                item['href'] = i.href
                lis.append(item)
    return lis


# 生成标签
@register.simple_tag
def generate_tag_html():
    tag_list = Tags.objects.all()[:15]
    tag_html = []
    for tag in tag_list:
        if tag.articles_set.all():
            tag_html.append(f'<li>{tag.title} <i>{tag.articles_set.count()}</i></li>')
        else:
            tag_html.append(f'<li>{tag.title}</li>')
    return mark_safe(''.join(tag_html))


# 获取用户头像
@register.filter
def get_avatar(user: UserInfo):
    if user.sign_status in [1, 2]:
        return user.avatar_url
    if user.avatar:
        return user.avatar.url.url
    return ''
