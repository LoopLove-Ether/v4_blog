"""
Django settings for v4_blog project.

Generated by 'django-admin startproject' using Django 4.2.3.

For more information on this file, see
https://docs.djangoproject.com/en/4.2/topics/settings/

For the full list of settings and their values, see
https://docs.djangoproject.com/en/4.2/ref/settings/
"""
import os
from pathlib import Path

# Build paths inside the project like this: BASE_DIR / 'subdir'.
BASE_DIR = Path(__file__).resolve().parent.parent

# Quick-start development settings - unsuitable for production
# See https://docs.djangoproject.com/en/4.2/howto/deployment/checklist/

# SECURITY WARNING: keep the secret key used in production secret!
SECRET_KEY = "django-insecure-$^!1ltq&m@us!6qk5voj16a$-1)63@0g5x(o8&emq2znm=yl17"

# SECURITY WARNING: don't run with debug turned on in production!
DEBUG = True

ALLOWED_HOSTS = ['*']

# Application definition

INSTALLED_APPS = [
    'simpleui',
    "django.contrib.admin",
    "django.contrib.auth",
    "django.contrib.contenttypes",
    "django.contrib.sessions",
    "django.contrib.messages",
    "django.contrib.staticfiles",
    'app01.apps.App01Config',
    'api.apps.ApiConfig',
]

MIDDLEWARE = [
    "django.middleware.security.SecurityMiddleware",
    "django.contrib.sessions.middleware.SessionMiddleware",
    "django.middleware.common.CommonMiddleware",
    "django.middleware.csrf.CsrfViewMiddleware",
    "django.contrib.auth.middleware.AuthenticationMiddleware",
    "django.contrib.messages.middleware.MessageMiddleware",
    "django.middleware.clickjacking.XFrameOptionsMiddleware",
    "app01.middleware.middleware_decode.Md1",
    "app01.middleware.middleware_decode.Statistical"
]

ROOT_URLCONF = "v4_blog.urls"

TEMPLATES = [
    {
        "BACKEND": "django.template.backends.django.DjangoTemplates",
        "DIRS": [BASE_DIR / 'templates']
        ,
        "APP_DIRS": True,
        "OPTIONS": {
            "context_processors": [
                "django.template.context_processors.debug",
                "django.template.context_processors.request",
                "django.contrib.auth.context_processors.auth",
                "django.contrib.messages.context_processors.messages",
            ],
        },
    },
]

WSGI_APPLICATION = "v4_blog.wsgi.application"

# Database
# https://docs.djangoproject.com/en/4.2/ref/settings/#databases

DATABASES = {
    "default": {
        "ENGINE": "django.db.backends.mysql",
        'NAME': 'v4_blog',  # 数据库名称
        'USER': 'root',  # 用户名
        'PASSWORD': '123456',  # 密码
        'HOST': 'localhost',  # 主机地址
        'PORT': 3306  # 端口
    }
}
# 缓存配置，使用的是内存缓存
CACHES = {
    'default': {
        'BACKEND': 'django.core.cache.backends.locmem.LocMemCache',
        'LOCATION': 'unique-snowflake'
    }
}

# Password validation
# https://docs.djangoproject.com/en/4.2/ref/settings/#auth-password-validators

AUTH_PASSWORD_VALIDATORS = [
    {
        "NAME": "django.contrib.auth.password_validation.UserAttributeSimilarityValidator",
    },
    {
        "NAME": "django.contrib.auth.password_validation.MinimumLengthValidator",
    },
    {
        "NAME": "django.contrib.auth.password_validation.CommonPasswordValidator",
    },
    {
        "NAME": "django.contrib.auth.password_validation.NumericPasswordValidator",
    },
]

AUTHENTICATION_BACKENDS = (
    'app01.valid.auth.CustomBackend',
)

# Internationalization
# https://docs.djangoproject.com/en/4.2/topics/i18n/

# LANGUAGE_CODE = "en-us"
#
# TIME_ZONE = "UTC"

LANGUAGE_CODE = "zh-hans"

TIME_ZONE = "Asia/Shanghai"

USE_I18N = True

USE_TZ = True

AUTH_USER_MODEL = "app01.UserInfo"

# Static files (CSS, JavaScript, Images)
# https://docs.djangoproject.com/en/4.2/howto/static-files/

STATIC_URL = "static/"
STATICFILES_DIRS = [
    os.path.join(BASE_DIR, "static")
]
# 收集项目的静态文件
STATIC_ROOT = os.path.join(BASE_DIR, 'ye_static')

# 用户自己上传文件
MEDIA_ROOT = os.path.join(BASE_DIR, 'media')
MEDIA_URL = '/media/'
DATA_UPLOAD_MAX_MEMORY_SIZE = 5242880  # 默认上传图片最大为5MB

# Default primary key field type
# https://docs.djangoproject.com/en/4.2/ref/settings/#default-auto-field

DEFAULT_AUTO_FIELD = "django.db.models.BigAutoField"

# simpleui
SIMPLEUI_HOME_INFO = False  # 关闭服务器信息
SIMPLEUI_HOME_QUICK = False  # 关闭快捷操作
SIMPLEUI_HOME_ACTION = False  # 关闭最近动作

# 自定义主页
SIMPLEUI_HOME = True

SIMPLEUI_HOME_PAGE = '/admin_home/'  # 将链接的页面放到admin的iframe标签中
SIMPLEUI_HOME_TITLE = '首页'
# SIMPLEUI_HOME_ICON = 'fa fa-user'

# 发送邮箱配置
EMAIL_HOST = 'smtp.qq.com'
EMAIL_PORT = 465  # 固定端口
EMAIL_HOST_USER = '3128909688@qq.com'  # 配置的是邮件的发送方
EMAIL_HOST_PASSWORD = 'wpgpgdudglawdgeb'  # 需要开启邮箱的SMTP服务(这里填写授权码)
DEFAULT_FROM_EMAIL = EMAIL_HOST_USER  # 固定搭配
EMAIL_USE_SSL = True  # QQ邮箱要用True,126邮箱要用False
EMAIL_USER_TLS = False

# 七牛云配置
QINIU_ACCESS_KEY = 'LTIEWcqeAVdF-cfvD-GKN7HIN2p9UWORX0j_bYxe'
QINIU_SECRET_KEY = 'yKKLnwbTUuKUpuZGvn4qIcNr8-_YrqJVq21Y8lN3'
QINIU_BUCKET_NAME = 'xiaoyeboke'
QINIU_DOMAIN = 'rzmhapg08.hn-bkt.clouddn.com'
