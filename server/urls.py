from unicodedata import name
from django import views
from django.contrib import admin
from django.urls import path,include
from . import views

app_name = 'server'

urlpatterns = [
   #服务创建
   path('open_add_server/',views.open_add_server,name='open_add_server'),
   path('inquirie_server_type/',views.inquirie_server_type,name='inquirie_server_type'),
   path('inquirie_server_name/',views.inquirie_server_name,name='inquirie_server_name'),
   path('sumbit_add_server_form/',views.sumbit_add_server_form,name='sumbit_add_server_form'),
   #服务分配
   path('open_distribute_server/',views.open_distribute_server,name='open_distribute_server'),
   path('inquire_add_server/',views.inquire_add_server,name='inquire_add_server'),
   path('inquirie_assign_name/',views.inquirie_assign_name,name='inquirie_assign_name'),
   path('back_server_detail/',views.back_server_detail,name='back_server_detail'),
   path('sumbit_distribute_server_form/',views.sumbit_distribute_server_form,name='sumbit_distribute_server_form'),
]
