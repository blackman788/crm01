from unicodedata import name
from django import views
from django.contrib import admin
from django.urls import path,include
from . import views

app_name = 'base'

urlpatterns = [
   #http://127.0.0.1:8000/sales/client/
   #营销机会管理
   path('inquire_cus_level/',views.inquire_cus_level,name='inquire_cus_level'),
]
