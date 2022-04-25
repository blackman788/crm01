from unicodedata import name
from django import views
from django.contrib import admin
from django.urls import path,include
from . import views

app_name = 'sales'

urlpatterns = [
   #http://127.0.0.1:8000/sales/client/
   #营销机会管理
   path('client/',views.select_sale_list,name='client'),
   path('sale_chance_index/',views.sale_chance_index,name='sale_chance_index'),
   path('sales_update/',views.sales_update,name='sales_update'),
   path('update_sumbit/',views.update_sumbit,name='update_sumbit'),
   path('delete_sales/',views.delete_sales,name='delete_sales'),
   #客户计划管理  select_dev_plan_detail  inquire_dev_plan
   path('sale_dev_plan_index/',views.sale_dev_plan_index,name='sale_dev_plan_index'),
   path('select_dev_plan__list/',views.select_dev_plan__list,name='dev_plan'),
   path('select_dev_plan_detail/<int:id>/',views.select_dev_plan_detail,name='select_dev_plan_detail'),
   path('inquire_dev_plan/<int:id>/',views.inquire_dev_plan,name='inquire_dev_plan'),
   path('add_dev_plan/<int:id>/',views.add_dev_plan,name='add_dev_plan'),
   path('delete_dev_plan/',views.delete_dev_plan,name='delete_dev_plan'),
   path('update_dev_plan/',views.update_dev_plan,name='update_dev_plan'),
]
