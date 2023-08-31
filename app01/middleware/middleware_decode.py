import json

from django.utils.deprecation import MiddlewareMixin
from api.utils.get_user_info import get_ip
from django.core.cache import cache


# 解析axios传来的post请求数据
class Md1(MiddlewareMixin):
    # 请求中间件
    def process_request(self, request):
        if request.method != 'GET' and request.META.get('CONTENT_TYPE') == 'application/json':
            data = json.loads(request.body)
            request.data = data

    # 响应中间件
    def process_response(self, request, response):
        return response


# 统计在线人数(通过IP地址的数目来计算)
class Statistical(MiddlewareMixin):
    def process_request(self, request):
        # 每次刷新页面时判断IP是否存在于已有的IP列表里
        # 不存在的话就存储到缓存里
        ip = get_ip(request)
        online_ips = list(cache.get("online_ips", []))  # 读取缓存列表

        if online_ips:
            online_ips = list(cache.get_many(online_ips).keys())

        cache.set(ip, 0, 10)  # 超时时间 10s,10s内检测不到该ip就移除掉

        if ip not in online_ips:
            online_ips.append(ip)

        cache.set("online_ips", online_ips)

        request.online_list = online_ips
