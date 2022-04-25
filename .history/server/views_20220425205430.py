import imp
from venv import create
from django.http import JsonResponse
from django.shortcuts import render
from django.views.decorators.http import require_GET,require_POST
from Customer.models import Contact, Customer
from base.models import DataDic
from system.models import User
from .models import CustomerServe
from django.core.paginator import Paginator
from django.views.decorators.csrf import csrf_exempt
from datetime import datetime
# Create your views here.
#------------------------------服务创建-----------------------start------------------

def open_add_server(request):
    return render(request,'server/add_server.html')

#获取服务类型  应写入base的视图内
@require_GET
def inquirie_server_type(request):
    type = request.GET.get('type')
    value = DataDic.objects.values('dataDicValue').filter(dataDicName=type).all()
    return JsonResponse(list(value),safe=False)

#获取客户人名册 应写在customer视图内
def inquirie_server_name(request):
    value = Customer.objects.values('name').all()
    return JsonResponse(list(value),safe=False)

#提交表单
@require_POST
@csrf_exempt
def sumbit_add_server_form(request):
    dict= request.POST.dict()
    csrfmiddlewaretoken = dict.pop('csrfmiddlewaretoken')
    dict['state'] = '新创建'
    dict['createPeople'] = request.session.get('user_name')
    CustomerServe.objects.create(**dict)
    return JsonResponse({'code':'200','msg':'创建成功'})
#------------------------------服务创建-----------------------end------------------

#------------------------------服务分配-----------------------start------------------
def open_distribute_server(request):
    return render(request,'server/distribute_server.html')

#获取分页 新创建的服务
@require_POST
@csrf_exempt
def inquire_add_server(request):
    try:
        #获取第几页
        page =request.POST.get('page')
        page_size=request.POST.get('rows')

        #返回多条结果行
        object_list = CustomerServe.objects.values().filter(state='新创建').order_by('-id')
             
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
        return JsonResponse({'code':'400','msg':'传输失败'})

#获取分配人列表
def inquirie_assign_name(request):
    value = User.objects.values('username').all()
    return JsonResponse(list(value),safe=False)

#返显数据
@require_GET
def back_server_detail(request):
    id = request.GET.get('id')
    y = CustomerServe.objects.values().get(pk=id)
    return JsonResponse({'code':'200','msg':'传输成功','y':y})

#提交表单
@require_POST
@csrf_exempt
def sumbit_distribute_server_form(request):
    id = request.POST.get('id')
    assigner= request.POST.get('assigner')
    #dict['state'] = '新创建'
    CustomerServe.objects.filter(pk=id).update(assigner=assigner,state='已分配',
                                assignTime=datetime.now(),updateDate=datetime.now())
    return JsonResponse({'code':'200','msg':'分配成功'})
#------------------------------服务分配-----------------------end--------------------

#------------------------------服务处理-----------------------end--------------------
#------------------------------服务处理-----------------------end--------------------