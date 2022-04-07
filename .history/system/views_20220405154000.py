import imp
from django.shortcuts import render
from django.views.decorators.http import require_POST
from .models import User
from django.http import JsonResponse
# Create your views here.
def login_register(request):
    return render(request,'login_register.html')


#验证用户名是否唯一
@require_POST
def check_username(request):
    try:
        username = request.POST.get('username')

        #获取数据库
        user = User.objects.get(username=username)

        return JsonResponse({'code':'400','msg':'用户名已存在,请重新输入'})
    except User.DoesNotExist as e:
        return JsonResponse({'code':'200','msg':'用户名可以注册'})
    

#验证邮箱是否唯一
def check_email(request):
    try:
        email = request.POST.get('email')

        #获取数据库
        eml = User.objects.get(email=email)

        return JsonResponse({'code':'400','msg':'该邮箱已存在,请重新输入'})
    except User.DoesNotExist as e:
        return JsonResponse({'code':'200','msg':'该邮箱可注册'})

#发送邮箱
def send_email(request):
    pass