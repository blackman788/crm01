from unicodedata import name
from django.db import connection
from django.shortcuts import render
from dbutil import pymysql_pool
import pymysql
# Create your views here.

#连接数据库池
config = {'host':'localhost',#数据库ip 等价于 127.0.0.1
          'port':3306,
          'user': 'root',#数据库用户名
          'password':'root',#
          'db' :'db_crm',#具体的一个库，等价于database
          'charset': 'utf8mb4',#字符集
          #autocommit = True,#默认不开启自动提交事务，True开启，False不开启
          'cursorclass': pymysql.cursors.DictCursor}


#初始化连接池对象
connect_pool = pymysql_pool.ConnectionPool(size=10,name='mysql_pool',**config)

#从连接池中获取连接
def connect():
    #从连接池中获取连接
    connection = connect_pool.get_connection()
    return connection


def sale_chance_index(request):
    """ 跳转营销机会首页 """
    return render(request,'SaleChance/client.html')




