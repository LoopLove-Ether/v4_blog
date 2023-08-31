from app01.models import Comment

def find_root_sub_comment(root_comment, sub_comment_list):
    for sub_comment in root_comment.comment_set.all():
        # 找根评论的子评论(一次寻找一个层级)
        sub_comment_list.append(sub_comment)
        find_root_sub_comment(sub_comment, sub_comment_list)

def sub_comment_list(nid):
    comment_query = Comment.objects.filter(article_id=nid).order_by("-create_time")  # 以列表形式返回数据
    # 把评论存储到列表
    comment_list = []

    for comment in comment_query:
        # 父评论是None,说明是根评论
        if not comment.parent_comment:
            # 递归查找根评论下面的所有子评论
            lis = []
            find_root_sub_comment(comment, lis)  # 此时的comment一定是根评论
            comment.sub_comment = lis
            comment_list.append(comment)
            continue
    return comment_list
