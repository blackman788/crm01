from unicodedata import name
from django import views
from django.contrib import admin
from django.urls import path,include
from . import views

app_name = 'sales'

urlpatterns = [
   #http://127.0.0.1:8000/sales/client/
   path('client/',views.select_sale_list,name='client'),
   path('sale_chance_index/',views.sale_chance_index,name='sale_chance_index'),
   path('sales_update/',views.sales_update,name='sales_update'),
]
