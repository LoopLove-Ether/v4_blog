import requests
from django.views import View
from django.http import JsonResponse

url = "https://api.codelife.cc/api/top/list"

# 请求头必须使用前端传递来的SignatureKey
class NewsView(View):
    def post(self,request):
        headers = request.headers
        try:
            # data是前端传递的请求参数
            res = requests.post(url,data=request.data,headers={
                'signaturekey':headers['Signaturekey'],
                'version':'1',
            })
        except Exception:
            return {'code':501,'msg':'请求异常','data':[]}

        return JsonResponse(res.json())

