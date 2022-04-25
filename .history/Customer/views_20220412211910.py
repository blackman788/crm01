from django.shortcuts import render
from .models import Customer,LinkMan
from system.models import User
# Create your views here.


#添加营销机会
def add_sales(requset):
    #获取联系人
    l = LinkMan.objects.get('linkName')