from django.shortcuts import render
from .models import DataDic
# Create your views here.



#查询客户等级
def inquire_cus_level(request):
    dictname = request.POST.get('dict_name')

    s = DataDic.objects.values().all().filter(dataDicName=dictname)

    content = {
        'id':s.id,
    dataDicValue = models.CharField(max_length=50, db_column='data_dic_value')
        'text':s.
    }