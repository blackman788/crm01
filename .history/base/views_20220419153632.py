from django.http import JsonResponse
from django.shortcuts import render
from .models import DataDic
# Create your views here.



#查询客户等级
def inquire_cus_level(request):
    try:
        dictname = request.POST.get('dict_name')

        s = DataDic.objects.values().all().filter(dataDicName=dictname)

        content = {
            'id':s.id,
            'text':s.dataDicValue
        }
        return JsonResponse(content)
    except Exception as e:
        pass