from django.contrib import admin
from app01.models import *  # 导入所有表
from django.utils.safestring import mark_safe
from django.core.mail import send_mail
from threading import Thread
from api.models import Email

from v4_blog import settings

# Register your models here.
# 每个类在注册的时候只显示主要的字段
# 要显示额外字段的话需要使用自定义类
# 文章表

admin.site.site_header = '小叶博客'  # 登录框的文字
admin.site.site_title = '小叶博客|后台系统'  # 浏览器头部信息


class ArticleAdmin(admin.ModelAdmin):
    # 自定义函数显示封面图片
    def get_cover(self):
        if self.cover:
            return mark_safe(f'<img src="{self.cover.url.url}" style="width:80%; height:60px; border-radius:5px;">')
        return

    # 字段描述
    get_cover.short_description = '文章封面'

    # 显示标签
    def get_tags(self):
        tag_list = ', '.join([i.title for i in self.tag.all()])
        return tag_list

    get_tags.short_description = '文章标签'

    # 通过标题跳转文章详情页
    def get_title(self):
        return mark_safe(f'<a href="/article/{self.nid}/" target="_blank">{self.title}</a>')

    get_title.short_description = '文章'

    # 获取编辑和删除
    def get_edit_delete_btn(self):
        return mark_safe(f"""
        <a href="/backend/edit_article/{self.nid}/" target="_blank">编辑</a>
        <a href="/admin/app01/articles/{self.nid}/delete/">删除</a>
        """)

    get_edit_delete_btn.short_description = '操作'
    list_display = [get_title,
                    get_cover,
                    get_tags,
                    'category',
                    'look_count', 'digg_count', 'comment_count', 'collects_count', 'word',
                    'change_date',
                    get_edit_delete_btn,
                    ]

    # 自定义动作
    def action_word(self, request, queryset):
        for obj in queryset:
            word = len(obj.content)
            obj.word = word
            obj.save()

    action_word.short_description = '获取文章字数'
    action_word.type = 'success'
    actions = [action_word]


# 用户表
class UserInfoAdmin(admin.ModelAdmin):
    def get_avatar(self: UserInfo):
        if self.sign_status in [1, 2]:
            return mark_safe(f'<img src="{self.avatar_url}" style="width:30px;height:30px;border-radius:50%;">')

        if self.avatar:
            return mark_safe(f'<img src="{self.avatar.url.url}" style="width:30px;height:30px;border-radius:50%;">')

    get_avatar.short_description = '头像'

    def get_user_name(self):
        if not self.sign_status:
            return self.username
        return '****'

    get_user_name.short_description = '用户名'

    list_display = [get_user_name,
                    'nick_name',
                    get_avatar,
                    'sign_status',
                    'ip',
                    'addr',
                    'is_superuser',
                    'date_joined',
                    'last_login',
                    ]

    # 获取头像
    def get_avatar_action(self, request, queryset):
        for obj in queryset:
            if not obj.sign_status:
                continue
            # 其他平台注册的

    get_avatar_action.short_description = '获取用户信息'

    actions = [get_avatar_action]


# 广告表
class AdvertAdmin(admin.ModelAdmin):
    # 跳转链接
    def get_href(self):
        return mark_safe(f""""<a href="{self.href}" target="_blank">跳转链接</a>""")

    get_href.short_description = "跳转链接"

    # 图片组
    def get_img_list(self):
        # 解析分号;
        # 解析换行符号\n
        html_s: str = self.img_list
        # 将输入的中文分号替换为英文分号(提高容错率)
        # 将换行符替换为英文分号
        html_new = html_s.replace("；", ";").replace('\n', ';')
        img_list = html_new.split(';')  # 以英文分号为界分隔图片组

        # 生成图片代码
        html_str = ''
        for i in img_list:
            html_str += f'<img src="{i}" style="height:60px;border-radius:5px;margin-right:10px">'
        return mark_safe(html_str)

    get_img_list.short_description = "轮播封面"

    # 单图
    def get_img(self):
        if self.img:
            return mark_safe(f"""<img src="{self.img.url}" style="height:60px;border-radius:5px;width:40%;">""")

    get_img.short_description = "用户上传"

    # 单图的权重要大于轮播图
    list_display = ['title',
                    get_img,
                    'is_show',
                    'author',
                    get_img_list,
                    get_href,
                    ]


admin.site.register(Articles, ArticleAdmin)
admin.site.register(UserInfo, UserInfoAdmin)
admin.site.register(Advert, AdvertAdmin)
admin.site.register(Tags)
admin.site.register(Cover)
admin.site.register(Comment)
admin.site.register(Avatars)


# 站点背景表
class MenuAdmin(admin.ModelAdmin):
    # 显示重写的添加背景页面
    add_form_template = 'simple_admin/add_form.html'

    # 显示重写的编辑背景页面
    change_form_template = 'simple_admin/add_form.html'

    def get_menu_url(self: Menu):
        # 获得所有背景图
        lis = [f"<img src='{i.url.url}' style='height:50px;border-radius:5px;margin-right:5px;margin-bottom:5px'>" for i
               in
               self.menu_url.all()]
        return mark_safe(''.join(lis))  # 拼接

    get_menu_url.short_description = '图片组'

    list_display = [
        'menu_title',
        'menu_title_en',
        'title',  # slogan标题
        'abstract',  # slogan介绍
        'rotation',  # 是否轮播slogan介绍
        'abstract_time',  # slogan切换时间
        'menu_rotation',  # 是否轮播banner图
        'menu_time',  # 背景图切换时间
        get_menu_url
    ]


# 站点背景图表
class MenuImgAdmin(admin.ModelAdmin):
    # 展示图片
    def get_img(self):
        if self.url:
            return mark_safe(f"""<img src="{self.url.url}" style="height:60px;border-radius:5px;width:40%;">""")

    get_img.short_description = '背景图'

    list_display = ['url', get_img]


admin.site.register(MenuImg, MenuImgAdmin)
admin.site.register(Menu, MenuAdmin)


# 网站导航表
class NavsAdmin(admin.ModelAdmin):
    list_display = ['title']


admin.site.register(Navs, NavsAdmin)


# 意见反馈表
class FeedBackAdmin(admin.ModelAdmin):
    list_display = ['email', 'content', 'status', 'processing_content']
    # 设置只读字段
    readonly_fields = ['email', 'content', 'status']

    # 禁用增加按钮
    def has_add_permission(self, request):
        return False

    # 重写保存方法(需要发邮件)
    def save_model(self, request, obj, form, change):
        # request是请求对象,obj是意见反馈对应的字段,form是编辑/添加的表单数据,change表示是编辑(True)还是添加(False)
        if not change:  # 禁用admin页面的添加意见反馈按钮(确保所有的意见反馈都是前端发过来的)
            return
        # 编辑回复
        email = obj.email
        content = obj.content
        obj.status = True
        processing_content = form.data.get('processing_content')
        # 开始发邮件
        # send_email是耗时操作,可以通过异步执行来减少耗时
        # Tread执行多线程
        # target是函数名
        # args是参数元组
        Thread(target=send_mail, args=(
            f'[小叶博客]你反馈的信息：{content}被回复了!',  # 邮件标题
            processing_content,  # 邮件内容
            settings.EMAIL_HOST_USER,  # 发件人
            [email],  # 收件人
            False  # 校验
        )).start()
        # 更新发送邮件数目
        Email.objects.create(
            email=email,
            content=processing_content
        )

        return super(FeedBackAdmin, self).save_model(request, obj, form, change)


admin.site.register(Feedback, FeedBackAdmin)
