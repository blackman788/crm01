from django.shortcuts import render

# Create your views here.
#------------------------------服务创建-----------------------start------------------

def open_add_server(request):
    return render(request,'server/add_server.html')

#------------------------------服务创建-----------------------end------------------