import email
from pyexpat import model
from turtle import update
from venv import create
from django.db import models
from pymysql import Timestamp
from datetime import datetime
# Create your models here.
class User(models.Model):
    username = models.CharField(max_length=20,db_column='user_name')
    password = models.CharField(max_length=100)
    truename = models.CharField(max_length=20,db_column='true_name',null=True)
    email = models.CharField(max_length=30)
    phone = models.CharField(max_length=20,null=True)
    is_valid = models.IntegerField(max_length=4,default=1)
    create_date = models.DateTimeField(default=datetime.now())
    update_date = models.DateTimeField(null=True)
    code = models.CharField(max_length=255,null=True)
    status =  models.BooleanField(max_length=1,default=0)
    timestamp = models.CharField(max_length=255,null=True) 

    class Meta(object):
        db_table = 't_uesr'