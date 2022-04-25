from unicodedata import name
from django.shortcuts import render
from dbutil import pymysql_pool
import pymysql
# Create your views here.

#连接数据库池
config = pymysql_pool(host = 'localhost',#数据库ip 等价于 127.0.0.1
                             user = 'root',#数据库用户名
                             password = 'root',#
                             db = 'db_crm',#具体的一个库，等价于database
                             charset = 'utf8mb4',#字符集
                             #autocommit = True,#默认不开启自动提交事务，True开启，False不开启
                             cursorclass = pymysql.cursors.DictCursor)


#初始化连接池对象
connect_pool = pymysql_pool.Connection(size=10,name='mysql_pool',**config)

