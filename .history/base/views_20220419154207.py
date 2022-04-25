from django.http import JsonResponse
from django.shortcuts import render
from .models import DataDic
# Create your views here.



#查询客户等级
def inquire_cus_level(request):
    try:
        dictname = request.GET.get('dict_name')

        s = DataDic.objects.values().all().filter(dataDicName=dictname)

        return JsonResponse(list(s),safe=False)
    except Exception as e:
        pass