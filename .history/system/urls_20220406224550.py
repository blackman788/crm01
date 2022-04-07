from unicodedata import name
from django import views
from django.contrib import admin
from django.urls import path,include
from . import views

app_name = 'system'

urlpatterns = [
   #http://127.0.0.1:8000/system/login_register/
   path('login_register/',views.login_register),
   path('check_username/',views.check_username,name='check_username'),
   path('check_email/',views.check_email,name='check_email'),
   path('send_email/',views.send_email,name='send_email'),
   path('active_username/',views.active_username,name='active_username'),
   path('login_user/',views.login_user,name='login_user'),

]
