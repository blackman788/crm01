import imp
from django.shortcuts import render
from django.views.decorators.http import require_POST
from .models import User
from django.http import JsonResponse
# Create your views here.
def login_register(request):
    return render(request,'login_register.html')

#验证用户名是否唯一
def check_username(request):
    usernme = request.POST.get('reg_username')
