from ast import If
from http.client import EXPECTATION_FAILED
from multiprocessing import context
from re import ASCII
from django.http import JsonResponse
from django.shortcuts import render
from .models import Customer,LinkMan
from system.models import User
from django.core.exceptions import ObjectDoesNotExist
# Create your views here.


#添加营销机会
def add_sales(requset):
    try:
        #获取 所有  联系人
        L_name = LinkMan.objects.values('id','linkName').all()
        #获取 所有 客户名称
        c_name = Customer.objects.values('id','name').all()
        #获取 所有 指派人 (用户)
        u_name = User.objects.values('id','username').all()

        
        
        context = {}
        return JsonResponse(context)
    except ObjectDoesNotExist as e:
        pass
    

if  __name__ == "__main__":
    L_name = LinkMan.objects.values('id','linkName').all()
    print(L_name)