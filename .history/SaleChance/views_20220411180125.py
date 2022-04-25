import imp
from tkinter import EXCEPTION
from unicodedata import name
from django.db import connection
from django.http import JsonResponse
from django.shortcuts import render
from dbutil import pymysql_pool
import pymysql
from django.views.decorators.http import require_GET
from django.core.paginator import Paginator
# Create your views here.

#连接数据库池
config = {'host':'localhost',#数据库ip 等价于 127.0.0.1
          'port':3306,
          'user': 'root',#数据库用户名
          'password':'root',#
          'db' :'db_crm',#具体的一个库，等价于database
          'charset': 'utf8mb4',#字符集
          #autocommit = True,#默认不开启自动提交事务，Tr ue开启，False不开启
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
        page_size=request.GET.get('rows')

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
	sl.link_name,
	sc.assign_man,
	sc.assign_time,
	sc.state,
	sc.dev_result 
FROM
	t_sale_chance sc
	LEFT JOIN t_customer t ON sc.customer_id = t.id
	LEFT JOIN t_customer_linkman sl ON sc.link_man = sl.id 
WHERE
	1 = 1 
	AND sc.dev_result = 2
        '''
        #执行sql
        cursor.execute(sql)
        #返回多条结果行
        object_list = cursor.fetchall()
        #关闭游标
        cursor.close()

        #初始化分页对象
        p = Paginator(object_list,page_size)
        #获取指定页数的数据
        data =p.page(page).object_list 
        #返回总条数
        count = p.count

        #准备数据
        context = {
            'total':count,
            'rows':data
        }
        return JsonResponse(context)
    except EXCEPTION as e:
        print(e)
        return JsonResponse({'code':'400','msg':'传输失败'})
    finally:
        #关闭连接
        connection.close()


