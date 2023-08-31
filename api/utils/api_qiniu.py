import time

from django.conf import settings
from qiniu import Auth, put_file, put_data

# pip install qiniu

# 秘钥
access_key = settings.QINIU_ACCESS_KEY
secret_key = settings.QINIU_SECRET_KEY
# 要上传的空间(七牛云中创建的空间名)
bucket_name = settings.QINIU_BUCKET_NAME
# 构建鉴权对象(鉴定是否是本人)
q = Auth(access_key, secret_key)


def upload_file(path, key=None, prefix='blog/'):
    """
    prefix：前缀
    :param path: 图片的路径
    :param key: 图片上传之后的名字
    :return: 在线路径
    """
    # 上传后保存的文件名

    # 不传名字时以时间切割为名
    if not key:
        key = prefix + str(int(time.time())) + '.' + path.split('.')[-1]
    else:
        key = prefix + key + '.' + path.split('.')[-1]
    # 生成上传 Token，可以指定过期时间等
    token = q.upload_token(bucket_name, key)

    # http://python.fengfengzhidao.com/my-python-logo.png

    # 提交数据
    put_file(token, key, path, version='v2')

    return f'http://{settings.QINIU_DOMAIN}/{key}'


def upload_data(file_data, key=None, suffix='.png', prefix='blog/'):
    """
        suffix: 后缀
        prefix：前缀
        :param file_data: 图片的字节数据
        :param key: 图片上传之后的名字
        :return: 在线路径
        """
    # 上传后保存的文件名

    if not key:
        key = prefix + str(int(time.time())) + suffix
    else:
        key = prefix + key + suffix
    # 生成上传 Token，可以指定过期时间等
    token = q.upload_token(bucket_name, key)
    # http://python.fengfengzhidao.com/my-python-logo.png

    le_data = put_data(token, key, file_data)
    print(le_data)

    return f'http://{settings.QINIU_DOMAIN}/{key}'


if __name__ == '__main__':
    # file_name = upload_file('./13.jpg')
    # print(file_name)
    with open('13.jpg', 'rb')as f:
        data = f.read()
        file_name = upload_data(data)
        print(file_name)