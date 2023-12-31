import os

if __name__ == '__main__':
    # 加载Django项目的配置信息
    os.environ.setdefault("DJANGO_SETTINGS_MODULE", "v4_blog.settings")
    # 导入Django,并启动Django项目
    import django

    django.setup()

    from app01.models import Moods
    from api.utils.get_addr_info import get_addr_info

    mood_query = Moods.objects.all()
    for obj in mood_query:
        addr = get_addr_info(obj.ip)
        obj.addr = addr
        obj.save()
        print(obj.addr,type(obj.addr))