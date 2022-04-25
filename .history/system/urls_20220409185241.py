from unicodedata import name
from django import views
from django.contrib import admin
from django.urls import path,include
from . import views

app_name = 'system'

urlpatterns = [
   #http://127.0.0.1:8000/system/login_register/
   path('system/login_register/',views.login_register,name='login_register'),
   path('system/check_username/',views.check_username,name='check_username'),
   path('system/check_email/',views.check_email,name='check_email'),
   path('system/send_email/',views.send_email,name='send_email'),
   path('system/active_username/',views.active_username,name='active_username'),
   path('system/login_user/',views.login_user,name='login_user'),
   path('index/',views.index,name='index'),
   path('system/update_password/',views.update_password,name='update_password'),
   path('system/logout/',views.logout,name='logout'),

]
