from django.shortcuts import render
from django.views.decorators.http import require_GET,require_POST
from Customer.models import Contact
# Create your views here.
#------------------------------服务创建-----------------------start------------------

def open_add_server(request):
    return render(request,'server/add_server.html')

#获取服务类型
@require_GET
def inquirie_server_type(request):
    type = request.GET.get('type')


#------------------------------服务创建-----------------------end------------------