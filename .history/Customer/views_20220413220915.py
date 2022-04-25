from ast import If
from http.client import EXPECTATION_FAILED
import json
from multiprocessing import context
from pickle import DICT
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
        #L_name = LinkMan.objects.values('id','linkName').all()
        L_name = LinkMan.objects.values('id','linkName').all()
        #获取 所有 客户名称
        c_name = Customer.objects.values('id','name').all()
        #获取 所有 指派人 (用户)
        u_name = User.objects.values('id','username').all()

        # 返回数据
        context = {
            'code': 200,
            'msg': 'success',
            'cs': list(c_name),  #用dict只能取到{'id': 'linkName'}  键值对需要保存在list内
            'ls': list(L_name),
            'us': list(u_name)
        }
        return JsonResponse(context)
    except ObjectDoesNotExist as e:
        return JsonResponse({'code': 400,'msg': 'error'})


#自动添加联系人电话    
def add_phone(request):
    try:
        i = request.GET.get('id')
        phone = LinkMan.objects.get(pk=i)
        
        context={
            'code':200,
            'msg':'传输成功',
            'phone':phone.phone
        }
        return JsonResponse(context)
    except Exception as e:
        return JsonResponse({
            'code':400,
            'msg':'error'
        })


#提交添加营销机会管理表单
def add_sumbit(request):
    #获取框中所有值