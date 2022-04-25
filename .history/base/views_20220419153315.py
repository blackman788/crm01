from django.shortcuts import render
from .models import DataDic
# Create your views here.



#查询客户等级
def inquire_cus_level(request):
    dictname = request.POST.get('dict_name')