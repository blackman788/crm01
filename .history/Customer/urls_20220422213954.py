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
   #联系人管理
   path('inquire_linkman_detail/',views.inquire_linkman_detail,name='inquire_linkman_detail'),
   path('linkman_detail/<int:id>/',views.linkman_detail,name='linkman_detail'),
   path('add_linkman_detail/<int:id>/',views.add_linkman_detail,name='add_linkman_detail'),
   path('update_linkman_detail/',views.update_linkman_detail,name='update_linkman_detail'),
   path('delete_linkman_detail/',views.delete_linkman_detail,name='delete_linkman_detail'),
   #交往记录
   path('inquire_contact_detail/',views.inquire_contact_detail,name='inquire_contact_detail'),
   path('contact_detail/<int:id>/',views.contact_detail,name='contact_detail'),
   path('add_contact_detail/<int:id>/',views.add_contact_detail,name='add_contact_detail'),
   path('update_contact_detail/',views.update_contact_detail,name='update_contact_detail'),
   path('delete_contact_detail/',views.delete_contact_detail,name='delete_contact_detail'),
   #历史记录
   path('inquire_order/',views.inquire_order,name='inquire_order'),
   path('gain_order/<int:id>/',views.gain_order,name='gain_order'),
   path('back_order_detail/',views.back_order_detail,name='back_order_detail'),
   path('order_detai/<int:id>/',views.order_detai,name='order_detai'),
   #客户流失记录
   path('inquire_loss/',views.inquire_loss,name='inquire_loss'),
   path('loss_detail/',views.loss_detail,name='loss_detail'),
]
