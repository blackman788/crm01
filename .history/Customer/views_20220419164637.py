from ast import DictComp, If
from http.client import EXPECTATION_FAILED
import imp
import json
from multiprocessing import context
from pickle import DICT
from re import ASCII, U
from urllib import request
from django.http import JsonResponse
from django.shortcuts import render
from Customer.models import Customer,LinkMan,Contact
from SaleChance.models import SaleChance
from system.models import User
from django.core.exceptions import ObjectDoesNotExist
from datetime import datetime
from django.views.decorators.http import require_GET,require_POST
from django.views.decorators.csrf import csrf_exempt
from django.core.paginator import Paginator
from django.views.decorators.csrf import csrf_exempt
from random import randint
from base.models import DataDic
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
    try:
        #获取框中所有值
        customerId = request.POST.get('customerId').strip() #取到id
        customerName = request.POST.get('customerName_hidden').strip()
        chanceSource = request.POST.get('chanceSource').strip()
        linkMan = request.POST.get('linkMan').strip() #取到id
        linkManName = request.POST.get('linkManName').strip()
        linkPhone = request.POST.get('linkPhone').strip()
        cgjl = request.POST.get('cgjl').strip()
        overview = request.POST.get('overview').strip()
        description = request.POST.get('description').strip()
        username = request.POST.get('username').strip()#取到id
        #如果有联系人 还需要添加联系人表
        """ if linkMan:
             lm = LinkMan(customer=customerId,linkName=linkManName,phone=linkPhone,isValid=1)
             lm.save() """

        #如果有指派人 添加
        if username is not '0':
            U = SaleChance(customerId=customerId,customerName=customerName,chanceSource=chanceSource,
                            linkMan=linkMan,linkPhone=linkPhone,cgjl=cgjl,overview=overview,
                            description=description,assignMan=username,assignTime=datetime.now(),state=1,
                            devResult=0,createMan=request.session.get('user_name')
            )
        else:
            U = SaleChance(customerId=customerId,customerName=customerName,chanceSource=chanceSource,
                            linkMan=linkMan,linkPhone=linkPhone,cgjl=cgjl,overview=overview,
                            description=description,state=0,
                            devResult=0,createMan=request.session.get('user_name')
            )
        U.save()
        return JsonResponse({'code': 200, 'msg': '添加成功'})
    except Exception as e:
        return JsonResponse({'code': 400, 'msg': '添加失败'})


#--------------------------------客户信息管理----------------------start-----------------------
def sale_cus_detail_index(request):
    """ 跳转客户信息 """
    return render(request,'Customer/cus_detail.html')

@csrf_exempt
@require_POST
def inquire_cus_detail(request):
    """ 查询计划 """
    try:
        #获取第几页
        page =request.POST.get('page')
        page_size=request.POST.get('rows')

        #返回多条结果行
        object_list = Customer.objects.values().all().order_by('-id')
        
        name = request.POST.get('name')
        khno = request.POST.get('khno')
        state = request.POST.get('state')

        if name:
            object_list = object_list.filter(name__icontains=name)

        if khno:
            object_list = object_list.filter(khno__icontains=khno)

        if state:
            object_list = object_list.filter(state=state)
            
        #初始化分页对象
        p = Paginator(object_list,page_size)
        #获取指定页数的数据
        data =p.page(page).object_list 
        #返回总条数
        count = p.count

        #准备数据
        context = {
            'total':count,
            'rows':list(data)
        }
        return JsonResponse(context)
    except Exception as e:
        print(e)
        return JsonResponse({'code':'400','msg':'传输失败'})

@require_GET
def add_cus_detail(request):
    dict = request.GET.dict()
    print(dict)
    level = dict.pop('level')
    v = DataDic.objects.values('dataDicName').filter(id=level)
    print(v)
    #dict['level'] =v
    """   result =''
    for i in range(0,3):
        result += str(randint(0,9))
    khno = 'KH' + datetime.now().strftime('%Y%m%d%H%M%S') + result
    dict['khno'] = khno
    Customer.objects.create(**dict) """
    return JsonResponse({'code':'200','msg':'传输成功'})



#--------------------------------客户信息管理----------------------end----------------------
