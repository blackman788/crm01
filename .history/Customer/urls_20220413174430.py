from unicodedata import name
from django import views
from django.contrib import admin
from django.urls import path,include
from . import views

app_name = 'customer'

urlpatterns = [
   #http://127.0.0.1:8000/system/login_register/
   path('add_sales/',views.add_sales,name='add_sales'),
   path('add_phone/',views.add_phone,name='add_phone')
]
