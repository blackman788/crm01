from django import views
from django.contrib import admin
from django.urls import path,include
from . import views
urlpatterns = [
   #http://127.0.0.1:8000/system/login_register/
   path('login_register/',views.login_register),
]
