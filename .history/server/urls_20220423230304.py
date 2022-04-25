from unicodedata import name
from django import views
from django.contrib import admin
from django.urls import path,include
from . import views

app_name = 'server'

urlpatterns = [
   path('open_add_server/',views.open_add_server,name='open_add_server'),
   path('inquirie_server_type/',views.inquirie_server_type,name='inquirie_server_type'),
   path('inquirie_server_name/',views.inquirie_server_name,name='inquirie_server_name'),
]
