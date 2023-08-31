from django import template
from app01.utils.search import Search
from django.utils.safestring import mark_safe
from app01.models import Tags, Avatars, Menu, Articles

register = template.Library()


# 自定义过滤器
# @register.filter
# def add1(item):
#     return int(item) + 1

@register.inclusion_tag('my_tag/headers.html')
def banner(menu_name, article=None):
    # 文章详情页面
    if article:
        # 文章的封面
        cover = article.cover.url.url
        img_list = [cover]
        title = article.title  # slogan标题
        slogan_list = [article.abstract[:30]]  # slogan介绍
        return locals()

    menu_obj = Menu.objects.get(menu_title_en=menu_name)  # 获得特定菜单名称的站点背景对象
    # 列表生成式,获得图片组
    img_list = [i.url.url for i in menu_obj.menu_url.all()]
    menu_time = menu_obj.menu_time  # 轮播时间
    title = menu_obj.title  # slogan标题
    slogan_list = menu_obj.abstract.replace('；', ';').replace('\n', ';').split(';')  # 需要被轮播的slogan介绍(替换切割)
    slogan_time = menu_obj.abstract_time  # slogan介绍轮播时间
    # 如果不轮播banner图
    if not menu_obj.menu_rotation:
        img_list = img_list[0:1]
        menu_time = 0

    # 如果不轮播slogan介绍
    if not menu_obj.rotation:
        slogan_list = slogan_list[0:1]
        slogan_time = 0

    return locals()


@register.simple_tag
def generate_order_html(request, key):
    order = request.GET.get(key, '')
    order_list = []
    if key == 'order':
        order_list = [
            ('', '综合排序'),
            ('-create_date', '最新发布'),
            ('-look_count', '最多浏览'),
            ('-digg_count', '最多点赞'),
            ('-collects_count', '最多收藏'),
            ('-comment_count', '最多评论')
        ]
    elif key == 'word':
        order = request.GET.getlist(key, '')
        order_list = [
            ([''], '全部字数'),
            (['0', '100'], '0~100字'),
            (['100', '500'], '100~500字'),
            (['500', '1000'], '500~1000字'),
            (['1000', '3000'], '1000~3000字'),
            (['3000', '5000'], '3000~5000字')
        ]
    elif key == 'tag':
        tag_list = Tags.objects.exclude(articles__isnull=True)  # 过滤出含标签的文章,减少计算量
        order_list.append(('', '全部标签'))
        for tag in tag_list:
            if tag.articles_set.all():
                order_list.append((tag.title, tag.title))

    query_params = request.GET.copy()

    order = Search(
        key=key,
        order=order,  # 当前筛选排序的状态
        order_list=order_list,
        query_params=query_params
    )
    # 安全的字符串就是可以被渲染的字符串
    return mark_safe(order.order_html())


# # 生成广告
# @register.simple_tag
# def generate_advert(advert_list):
#     html_list = []  # 前端代码字符串列表
#     # 遍历所有广告对象
#     for i in advert_list:
#         if i.img:
#             # 单图
#             html_list.append(
#                 f'<div><a href="{i.href}" title="{i.title}" target="_blank"><img src="{i.img.url}"></a></div>')
#             continue
#         # 图片组
#         html_s: str = i.img_list
#         html_new = html_s.replace("；", ";").replace('\n', ';')
#         img_list = html_new.split(';')
#         for url in img_list:
#             html_list.append(f'<div><a href="{i.href}" title="{i.title}" target="_blank"><img src="{url}"></a></div>')
#     return mark_safe(''.join(html_list))


# 生成心情配图
@register.simple_tag
def generate_drawing(drawing):
    if not drawing:
        return ''
    drawing = drawing.replace("；", ";").replace('\n', ';')
    drawing_list = drawing.split(';')  # 心情配图以英文分号进行切割
    html_s = ''
    for i in drawing_list:
        html_s += f'<img @error="img_error" src="{i}" alt="">'

    return mark_safe(html_s)


# 事件内容分行
@register.simple_tag
def generate_li(content):
    if not content:
        return ''
    content = content.replace("；", ";").replace('\n', ';')
    content_list = content.split(';')  # 心情配图以英文分号进行切割
    html_s = ''
    for i in content_list:
        html_s += f'<li>{i}</li>'

    return mark_safe(html_s)


# 上一篇 下一篇
@register.simple_tag
def generate_p_n(article):
    article_list = list(Articles.objects.filter(category=article.category))  # 后端列表(本身是查询集,转成列表)
    # 处理边界
    now_index = article_list.index(article)  # 当前所在的索引
    max_index = len(article_list) - 1  # 列表长度

    # 到达左边界
    if now_index == 0:
        prev = '<a href="javascript:void (0);">已经是第一篇了</a>'
    else:
        prev_article = article_list[article_list.index(article) - 1]  # 上一篇(当前文章在类别列表中的索引 - 1)
        prev = f'<a href="/article/{prev_article.nid}/">上一篇：{prev_article.title}</a>'

    # 到达右边界
    if now_index == max_index:
        next = '<a href="javascript:void (0);">已经是最后一篇了</a>'
    else:
        next_article = article_list[article_list.index(article) + 1]  # 下一篇(当前文章在类别列表中的索引 + 1)
        next = f'<a href="/article/{next_article.nid}/">下一篇：{next_article.title}</a>'

    return mark_safe(prev + next)


# 计算某个分类的文章数
@register.simple_tag
def calculation_category_count(cid):
    # 参数是分类id
    article_query = Articles.objects.filter(category=cid)
    return article_query.count()
