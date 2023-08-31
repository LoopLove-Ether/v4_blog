def find_root_comment(comment):
    # 找comment的根评论
    if comment.parent_comment:
        # 不是根评论
        # 递归寻找根评论
        return find_root_comment(comment.parent_comment)
    # 是根评论
    return comment