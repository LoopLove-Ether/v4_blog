from django.views import View
from django.http import JsonResponse
from django import forms
from app01.models import Comment, Articles
from django.db.models import F
from api.utils.find_root_comment import find_root_comment
from app01.utils.sub_comment import find_root_sub_comment

# 错误信息处理
def clean_form(form):
    err_dict: dict = form.errors
    # 拿到第一个错误的字段名字(键)
    err_valid = list(err_dict.keys())[0]
    # 拿到第一个字段的第一个错误信息
    err_msg = err_dict[err_valid][0]
    return err_valid, err_msg


# 评论
class CommentView(View):
    # 发布评论
    def post(self, request, nid):
        res = {
            'msg': '文章评论成功',
            'code': 412,
            'self': None
        }
        data = request.data
        if not request.user.username:
            res['msg'] = '请登录'
            return JsonResponse(res)
        content = data.get('content')
        if not content:
            res['msg'] = '请输入评论内容'
            res['self'] = 'content'
            return JsonResponse(res)

        pid = data.get('pid')

        # 文章评论数+1
        Articles.objects.filter(nid=nid).update(comment_count=F('comment_count') + 1)

        if pid:
            # 不是根评论
            comment_obj = Comment.objects.create(
                content=content,
                user=request.user,
                article_id=nid,
                parent_comment_id=pid
            )  # 向评论表中添加数据
            # 不是根评论才可以让根评论下的回复数增加
            # 找最终的根评论
            root_comment_obj = find_root_comment(comment_obj)
            root_comment_obj.comment_count += 1
            root_comment_obj.save()

        else:
            # 根评论
            # 文章评论校验成功
            Comment.objects.create(
                content=content,
                user=request.user,
                article_id=nid
            )  # 向评论表中添加数据
        res['code'] = 0
        return JsonResponse(res)

    # 删除评论
    def delete(self, request, nid):
        # 只能删除自己发的评论,超级管理员可以任意删除
        res = {
            'msg': '评论删除成功',
            'code': 412,
        }
        # 登录用户
        login_user = request.user
        comment_query = Comment.objects.filter(nid=nid) # nid是评论id
        # 评论用户
        comment_user = comment_query.first().user

        aid = request.data.get('aid')  # 文章id
        pid = request.data.get('pid')  # 根评论id

        if not (login_user == comment_user or login_user.is_superuser):
            # 不能删除
            res['msg'] = '用户验证失败'
            return JsonResponse(res)

        # 删除的是根评论
        # 计算根评论之下的子评论数量
        lis = []
        find_root_sub_comment(comment_query.first(), lis)
        Articles.objects.filter(nid=aid).update(comment_count=F('comment_count') - len(lis) - 1)

        if pid:
            # 删除子评论
            # 不是根评论才可以让根评论下的回复数减少
            # 找最终的根评论-1
            Comment.objects.filter(nid=pid).update(comment_count=F('comment_count') - len(lis) - 1)

        comment_query.delete()
        res['code'] = 0

        return JsonResponse(res)

class CommentDiggView(View):
    # 点赞
    def post(self,request,nid):
        # nid是评论id
        res = {
            'msg': '点赞成功',
            'code': 412,
            'data': 0,
        }
        if not request.user.username:
            res['msg'] = '请登录'
            return JsonResponse(res)
        comment_query = Comment.objects.filter(nid=nid)
        comment_query.update(digg_count =F('digg_count') + 1) #更新评论表中的点赞数据

        digg_count = comment_query.first().digg_count #拿到评论的点赞数

        res['code'] = 0
        res['data'] = digg_count
        return JsonResponse(res)