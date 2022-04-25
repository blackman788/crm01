from unicodedata import name
from django import views
from django.contrib import admin
from django.urls import path,include
from . import views

app_name = 'customer'

urlpatterns = [
   #http://127.0.0.1:8000/system/login_register/
   path('add_sales/',views.add_sales,name='add_sales'),
   path('add_phone/',views.add_phone,name='add_phone'),
   path('add_sumbit/',views.add_sumbit,name='add_sumbit'),
   path('sale_cus_detail_index/',views.sale_cus_detail_index,name='sale_cus_detail_index'),
   path('inquire_cus_detail/',views.inquire_cus_detail,name='inquire_cus_detail'),
   path('add_cus_detail/',views.add_cus_detail,name='add_cus_detail'),
   path('back_cus_detail/',views.back_cus_detail,name='back_cus_detail'),
   path('update_cus_detail/',views.update_cus_detail,name='update_cus_detail'),
   path('delete_cus_detail/',views.delete_cus_detail,name='delete_cus_detail'),
   path('inquire_linkman_detail/<int:id>/',views.inquire_linkman_detail,name='inquire_linkman_detail'),
   path('linkman_detail',views.linkman_detail,name='linkman_detail'),
]
