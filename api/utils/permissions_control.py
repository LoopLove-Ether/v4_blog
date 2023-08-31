from django.http import JsonResponse
from django.shortcuts import redirect


# 函数视图装饰器
def is_super_fun(fun):
    # inner的参数对应其他使用装饰器的视图函数的参数
    def inner(*args, **kwargs):
        request = args[0]
        if not request.user.is_superuser:
            # 未登录
            return redirect('/')
        res = fun(*args, **kwargs)
        return res

    return inner


# 类视图装饰器
def is_super_method(fun):
    # inner的参数对应其他使用装饰器的视图函数的参数
    def inner(*args, **kwargs):
        request = args[1]
        # 既验证了是否是超级管理员,又验证了是否登录
        if not request.user.is_superuser:
            res = {
                'code': 555,
                'msg': '权限验证失败'
            }
            return JsonResponse(res)
        res = fun(*args, **kwargs)
        return res

    return inner
