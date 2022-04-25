import imp
from venv import create
from django.http import JsonResponse
from django.shortcuts import render
from django.views.decorators.http import require_GET,require_POST
from Customer.models import Contact, Customer
from base.models import DataDic
from .models import CustomerServe
from django.core.paginator import Paginator
from django.views.decorators.csrf import csrf_exempt
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
def inquire_add_server(requset):
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
#------------------------------服务分配-----------------------end--------------------