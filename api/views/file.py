import base64
import time

from django.views import View
from django.http import JsonResponse
from app01.models import Avatars, Cover, UserInfo
from django.core.files.uploadedfile import InMemoryUploadedFile
from app01.models import avatar_delete, cover_delete
from django.db.models import Q
from api.utils.api_qiniu import upload_data


# 头像
class AvatarView(View):
    def post(self, request):
        res = {
            "code": 345,
            'msg': '文件上传成功',
        }
        if not request.user.is_superuser:
            res['msg'] = '用户验证失败'
            return JsonResponse(res)
        file: InMemoryUploadedFile = request.FILES.get('file')
        name: str = file.name  # 文件全称
        # 文件格式白名单
        white_file_type = [
            'jpg',
            'jpeg',
            'png'
        ]
        if name.split('.')[-1] not in white_file_type:
            res['msg'] = '文件格式不合法'
            return JsonResponse(res)

        kb = file.size / 1024
        if kb > 500:
            res['msg'] = '图片大小超过500KB'
            return JsonResponse(res)
        # 将上传的头像文件添加到数据库中
        Avatars.objects.create(url=file)
        res['code'] = 0
        return JsonResponse(res)

    def delete(self, request, nid):

        res = {
            'code': 322,
            'msg': '图片删除成功',
        }
        if not request.user.is_superuser:
            res['msg'] = '用户验证失败'
            return JsonResponse(res)
        avatar_query = Avatars.objects.filter(nid=nid)  # 从数据库中查询到相应头像
        if not avatar_query:
            res['msg'] = '图片已被删除'
            return JsonResponse(res)
        # 判断图片是不是有人在使用
        obj: Avatars = avatar_query.first()
        userquery = UserInfo.objects.filter(Q(sign_status=0) | Q(sign_status=1))
        for user in userquery:
            if obj.url.url == user.avatar_url:
                res['msg'] = '头像正被其他用户使用'
                return JsonResponse(res)

        avatar_delete(obj)  # 删除源文件(没有此方法的话要自己使用OS模块找到相应的路径去删除)
        avatar_query.delete()  # 从数据库中删除

        res['code'] = 0
        return JsonResponse(res)


# 封面
class CoverView(View):
    def post(self, request):
        res = {
            "code": 345,
            'msg': '文件上传成功',
        }
        if not request.user.is_superuser:
            res['msg'] = '用户验证失败'
            return JsonResponse(res)
        file: InMemoryUploadedFile = request.FILES.get('file')
        name: str = file.name  # 文件全称
        # 文件格式白名单
        white_file_type = [
            'jpg',
            'jpeg',
            'png'
        ]
        if name.split('.')[-1] not in white_file_type:
            res['msg'] = '文件格式不合法'
            return JsonResponse(res)

        kb = file.size / 1024
        if kb > 500:
            res['msg'] = '图片大小超过500KB'
            return JsonResponse(res)
        # 将上传的封面文件添加到数据库中
        Cover.objects.create(url=file)
        res['code'] = 0
        return JsonResponse(res)

    def delete(self, request, nid):

        res = {
            'code': 322,
            'msg': '图片删除成功',
        }
        if not request.user.is_superuser:
            res['msg'] = '用户验证失败'
            return JsonResponse(res)
        cover_query = Cover.objects.filter(nid=nid)  # 从数据库中查询到相应封面
        if not cover_query:
            res['msg'] = '图片已被删除'
            return JsonResponse(res)

        cover_delete(cover_query.first())  # 删除源文件(没有此方法的话要自己使用OS模块找到相应的路径去删除)
        cover_query.delete()  # 从数据库中删除

        res['code'] = 0
        return JsonResponse(res)


# 粘贴上传
class PasteUpload(View):
    def post(self, request):
        img = request.data.get('image')
        ines = img.split('base64,')  # 对图片进行解析切割
        imgData = base64.b64decode(ines[1])  # 字节数据
        url = upload_data(imgData)
        return JsonResponse({'url':url})
