from django import views
from django.contrib import admin
from django.urls import path,include
from . import views
urlpatterns = [
   path('login_register/',views.login_register),
]
