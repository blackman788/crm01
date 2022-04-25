from django.shortcuts import render
from django.views.decorators.http import require_GET,require_POST
# Create your views here.
#------------------------------服务创建-----------------------start------------------

def open_add_server(request):
    return render(request,'server/add_server.html')

#获取服务类型
@
def inquirie_server_type(request):

#------------------------------服务创建-----------------------end------------------