from django.shortcuts import render
from .models import Customer,LinkMan
from system.models import User
# Create your views here.


#添加营销机会
def add_sales(requset):
    #获取 所有  联系人
    L_name = LinkMan.objects.values('id','linkName').all()
    #获取 所有 客户名称
    c_name = Customer.objects.values('name').all()
    #获取 所有 指派人 (用户)
    u_name = User.objects.values('username').all()

