from django.shortcuts import render
from .models import Customer,LinkMan
from system.models import User
# Create your views here.


#添加营销机会
def add_sales(requset):
    #获取联系人
    L_name = LinkMan.objects.get('linkName')
    #获取客户名称
    c_name = Customer.objects.get('name')
    #获取指派人 (用户)
    u_name = User.objects.get('username')