from django.shortcuts import render
import pymysql.cursors
# Create your views here.

#连接数据库池
connection = pymysql.connect(host = 'localhost',#数据库ip 等价于 127.0.0.1
                             user = 'root',#数据库用户名
                             password = 'root',#
                             db = 'db_crm',#具体的一个库，等价于database
                             charset = 'utf8mb4',#字符集
                             #autocommit = True,#默认不开启自动提交事务，True开启，False不开启
                             cursorclass = pymysql.cursors.DictCursor)