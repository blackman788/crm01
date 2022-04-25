from tkinter import EXCEPTION
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

def select_sale_list(request):
    """ 查询所有营销计划 """
    try:
        #获取第几页
        page =request.GET.get('page')
        rows=request.GET.get('rows')

        #获取连接
        connection = connect()
        #创建游标对象
        cursor = connection.cursor()

        #编写sql
        sql='''
                    SELECT
                sc.customer_id,
                t.`name`,
                sc.overview,
                sc.create_man,
                sc.link_phone,
                sc.link_man,
                sc.assign_man,
                sc.assign_time,
                sc.state,
                sc.dev_result 
            FROM
                t_sale_chance sc
                LEFT JOIN t_customer t ON sc.customer_id = t.id
        '''
        #执行sql
        cursor.execute(sql)
        #返回多条结果行
        object_list = cursor.fetchall()
        #关闭游标
        cursor.close()
    except EXCEPTION as e:
        print(e)
    finally:
        #关闭连接
        connection.close()


