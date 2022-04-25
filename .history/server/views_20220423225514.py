from django.http import JsonResponse
from django.shortcuts import render
from django.views.decorators.http import require_GET,require_POST
from Customer.models import Contact
from base.models import DataDic
# Create your views here.
#------------------------------服务创建-----------------------start------------------

def open_add_server(request):
    return render(request,'server/add_server.html')

#获取服务类型
@require_GET
def inquirie_server_type(request):
    type = request.GET.get('type')
    value = DataDic.objects.values('dataDicName').filter(dataDicName=type).all()
    return JsonResponse(list(value),safe=false)

#------------------------------服务创建-----------------------end------------------