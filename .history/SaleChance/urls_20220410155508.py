from unicodedata import name
from django import views
from django.contrib import admin
from django.urls import path,include
from . import views

app_name = 'sales'

urlpatterns = [
   #http://127.0.0.1:8000/system/login_register/
   path('client/',views.sale_chance_index,name='client')
]
