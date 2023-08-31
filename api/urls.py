from django.contrib import admin
from django.urls import path, re_path
from api.views import login, article, comment, news, mood, user, file, api_email, history, site, admin_data

urlpatterns = [
    path("login/", login.LoginView.as_view()),  # 登录
    path("sign/", login.SignView.as_view()),  # 注册
    path("get_online/", admin_data.get_online),  # 获取在线人数
    path("get_seven_data/", admin_data.get_seven_data),  # 获取七天内的登录人数和注册人数
    path("article/", article.ArticleView.as_view()),  # 发布文章
    path("news/", news.NewsView.as_view()),  # 新闻
    path("moods/", mood.MoodsView.as_view()),  # 发布心情
    path('edit_password/', user.EditPasswordView.as_view()),  # 修改密码
    path('edit_avatar/', user.EditAvatarView.as_view()),  # 修改头像
    path('upload/avatar/', file.AvatarView.as_view()),  # 上传头像
    path('upload/cover/', file.CoverView.as_view()),  # 上传封面
    path('send_email/', api_email.ApiEmail.as_view()),  # 发送邮件
    path('perfect_information/', user.EditUserInfoView.as_view()),  # 完善信息
    path('cancel_collection/', user.CancelCollection.as_view()),  # 取消收藏
    path('paste_upload/', file.PasteUpload.as_view()),  # 粘贴上传
    path('history/', history.HistoryView.as_view()),  # 发布事件
    path('site_tag/', site.NavTagsView.as_view()),  # 添加网站标签
    path('site/', site.NavView.as_view()),  # 获取网站数据列表
    path('friends_links/', site.FriendLinks.as_view()),  # 友链申请
    path('feedback/', user.FeedBackView.as_view()),  # 意见反馈

    re_path(r'site/(?P<nid>\d+)/', site.NavView.as_view()),  # 编辑网站数据
    re_path(r'site_tag/(?P<nid>\d+)/', site.NavTagsView.as_view()),  # 编辑网站标签
    re_path(r'site_digg/(?P<nid>\d+)/', site.NavDiggView.as_view()),  # 点赞网站
    re_path(r'site_coll/(?P<nid>\d+)/', site.NavCollectsView.as_view()),  # 网站收藏
    re_path(r"article/(?P<nid>\d+)/", article.ArticleView.as_view()),  # 编辑文章
    re_path(r"article/comment/(?P<nid>\d+)/", comment.CommentView.as_view()),  # 发布评论
    re_path(r"comment/digg/(?P<nid>\d+)/", comment.CommentDiggView.as_view()),  # 评论点赞
    re_path(r"article/digg/(?P<nid>\d+)/", article.AtricleDiggView.as_view()),  # 文章点赞
    re_path(r"article/collects/(?P<nid>\d+)/", article.ArticleCollectsView.as_view()),  # 文章收藏
    re_path(r"moods/(?P<nid>\d+)/", mood.MoodsView.as_view()),  # 删除心情
    re_path(r"mood_comments/(?P<nid>\d+)/", mood.MoodCommentsView.as_view()),  # 发布心情评论
    re_path(r"upload/avatar/(?P<nid>\d+)/", file.AvatarView.as_view()),  # 删除头像
    re_path(r"upload/cover/(?P<nid>\d+)/", file.CoverView.as_view()),  # 删除封面
    re_path(r"history/(?P<nid>\d+)/", history.HistoryView.as_view()),  # 编辑事件
    re_path(r"article_pwd/(?P<nid>\d+)/", article.ArticlePwdView.as_view()),  # 查看加密文章
    re_path(r"article/cover/(?P<nid>\d+)/", article.EditArticleCoverView.as_view()),  # 修改文章封面
]
