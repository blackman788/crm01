import imp
from re import A
from tkinter import EXCEPTION
from unicodedata import name
from django.db import connection
from django.http import JsonResponse
from django.shortcuts import render
from dbutil import pymysql_pool
import pymysql
from SaleChance.models import SaleChance
from django.views.decorators.http import require_GET,require_POST
from django.core.paginator import Paginator
from django.views.decorators.csrf import csrf_exempt,csrf_protect
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

@csrf_exempt
@require_POST
def select_sale_list(request):
    """ 查询所有营销计划 """
    try:
        #获取第几页
        page =request.POST.get('page')
        page_size=request.POST.get('rows')

        #获取连接
        connection = connect()
        #创建游标对象
        cursor = connection.cursor()

        #编写sql
        sql='''
            SELECT
                sc.id,
                sc.customer_id,
                t.`name`,
                t.khno,
                sc.overview,
                sc.create_man,
                sc.link_phone,
                sl.link_name,
                sc.link_man, 
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
        '''  #sc.link_man  取到id值
        #查询
        customername = request.POST.get('name')
        overview = request.POST.get('overview')
        create_man = request.POST.get('create_man')
        state = request.POST.get('state')

        if customername:
            sql += "AND t.`name` LIKE '%{}%' ".format(customername)
        if overview:
            sql += "AND sc.overview LIKE '%{}%' ".format(overview)
        if create_man :
            sql += "AND sc.create_man LIKE '%{}%' ".format(create_man)
        if state:
            sql += "AND sc.state = {} ".format(state)
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


#修改营销机会
@csrf_exempt
@require_POST
def sales_update(request):
    try:
        id = request.POST.get('id')

        #查询sql
        #获取连接
        connection = connect()
        #创建游标对象
        cursor = connection.cursor()
        #编写sql
        sql='''
            SELECT
                sc.customer_id,
                t.`name`,
                t.khno,
                sc.cgjl,
                sc.chance_source,
                sc.overview,
                sc.description,
                sc.create_man,
                sc.link_phone,
                sc.link_man,
                sl.link_name,
                sc.assign_man,
                sc.assign_time,
                sc.state,
                sc.dev_result,
                tu.id
            FROM
                t_sale_chance sc
                LEFT JOIN t_customer t ON sc.customer_id = t.id
                LEFT JOIN t_customer_linkman sl ON sc.link_man = sl.id 
                LEFT JOIN t_user tu on sc.create_man = tu.user_name
            WHERE
                1 = 1
            AND
                sc.customer_id=%s 
        '''

        #执行sql
        cursor.execute(sql,(id,))
        #返回多条结果行
        object_list = cursor.fetchone()
        #关闭游标
        cursor.close()

        return JsonResponse({'code':'200','msg':'传输成功','object':object_list})
    except Exception as e:
        return JsonResponse({'code':'400','msg':'传输失败'})

    finally:
        connection.close()


#修改传过来的数值
@csrf_exempt
@require_POST
def update_sumbit(request):
    try:
        dict01 = request.POST.dict()
        id = dict01.pop('idss')
        
        #获取委托人 若存在则修改state为已分配 1  无则更改为未分配 0
        assign_man = dict01.get('update_assignName_hidden')

        if '0' == assign_man:
            dict01['state']='0'
        else:
            dict01['state']='1'
        # 修改数据
        SaleChance.objects.filter(pk=id).update(**dict01)
        return JsonResponse({'code':'200','msg':'传输成功'})
    except Exception as e:
        return JsonResponse({'code':'200','msg':'传输失败'})

#删除营销机会
@csrf_exempt
@require_POST
def delete_sales(request):
    try:
        connection = connect()
        #创建游标对象
        cursor = connection.cursor()

        #取到id 进行逻辑删除  ---> 不是真正的删除,而是将 is_valid 改为 0
        id = request.POST.get('id')  #[11,12]
        ids = id.split(',')
        for i in ids:
             #编写sql
            sql='''
                UPDATE t_sale_chance 
                SET is_valid =0
                WHERE
                    id = 91
            '''

            #执行sql
            cursor.execute(sql,(id,))
    
        #关闭游标
        cursor.close()


        return JsonResponse({'code':'200','msg':'传输成功'})
    except Exception as e:
        return JsonResponse({'code':'200','msg':'传输失败'})
    finally:
        connection.close()