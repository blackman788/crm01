from django.http import JsonResponse
from django.shortcuts import render
from django.views.decorators.http import require_GET,require_POST
from Customer.models import Contact, Customer
from base.models import DataDic
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
    return JsonResponse({'code':'200'})
#------------------------------服务创建-----------------------end------------------