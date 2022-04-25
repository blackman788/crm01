import imp
from re import A
from tkinter import EXCEPTION
from turtle import isvisible
from unicodedata import name
from django.db import connection
from django.http import JsonResponse
from django.shortcuts import redirect, render
from dbutil import pymysql_pool
import pymysql
from SaleChance.models import SaleChance,CusDevPlan
from django.views.decorators.http import require_GET,require_POST
from django.core.paginator import Paginator
from django.views.decorators.csrf import csrf_exempt,csrf_protect
from datetime import datetime
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
                LEFT JOIN t_user tu on sc.assign_man = tu.id
            WHERE
                1 = 1
            AND
                sc.is_valid = 1
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
        sql += ' ORDER BY sc.id DESC;'
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
                LEFT JOIN t_user tu on sc.assign_man = tu.id
            WHERE
                1 = 1
            AND
                sc.id=%s 
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
        #获取连接
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
                    id = %s
            '''
            #执行sql
            cursor.execute(sql,(i,))
    
        # 提交
        connection.commit()

        #关闭游标
        cursor.close()
        return JsonResponse({'code':'200','msg':'传输成功'})
    except Exception as e:
        return JsonResponse({'code':'200','msg':'传输失败'})
    finally:
        connection.close()


#-------------------------------------客户开发计划-------------------------------------------
def sale_dev_plan_index(request):
    """ 跳转客户计划首页 """
    return render(request,'SaleChance/dev_plan.html')

@csrf_exempt
@require_POST
def select_dev_plan__list(request):
    """ 查询计划 """
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
                sc.overview,
                sc.create_man,
                sl.link_name,
                sc.link_phone,
                sc.link_man, 
                sc.assign_man,
                sc.assign_time,
                sc.dev_result 
            FROM
                t_sale_chance sc
                LEFT JOIN t_customer t ON sc.customer_id = t.id
                LEFT JOIN t_customer_linkman sl ON sc.link_man = sl.id
                LEFT JOIN t_user tu on sc.assign_man = tu.id
            WHERE
                1 = 1
            AND
                sc.is_valid = 1
            AND 
                sc.state = 1
        '''  #sc.link_man  取到id值
        #查询
        customername = request.POST.get('name')
        overview = request.POST.get('overview')
        devresult = request.POST.get('dev_result')
        

        if customername:
            sql += "AND t.`name` LIKE '%{}%' ".format(customername)
        if overview:
            sql += "AND sc.overview LIKE '%{}%' ".format(overview)
        if devresult:
            sql += "AND sc.dev_result  = {} ".format(devresult)
        sql += ' ORDER BY sc.id DESC;'
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

#跳转操作页面
@require_GET
def select_dev_plan_detail(request,id):
    #sql获取数据
    try:
        #查询sql
        #获取连接
        connection = connect()
        #创建游标对象
        cursor = connection.cursor()
        #编写sql
        sql='''
            SELECT
                sc.id,
                t.`name`,
                sc.chance_source,
                sc.link_man ,
                sc.link_phone linkPhone,
                sl.link_name linkName,
                sc.cgjl,
                sc.overview,
                sc.description,
                sc.create_man createMan,
                sc.create_date createDate,
                sc.assign_man assignMan,
                sc.assign_time assignTime,
                sc.state,
                sc.dev_result,
                tu.id 
            FROM
                t_sale_chance sc
                LEFT JOIN t_customer t ON sc.customer_id = t.id
                LEFT JOIN t_customer_linkman sl ON sc.link_man = sl.id
                LEFT JOIN t_user tu ON sc.assign_man = tu.id 
            WHERE
                1 = 1 
                AND sc.id =%s
        '''

        #执行sql
        cursor.execute(sql,(id,))
        #返回多条结果行
        object_list = cursor.fetchone()
        #关闭游标
        cursor.close()
        return render(request,'SaleChance/dev_plan_detail.html',{'dt':object_list})
    except Exception as e:
        return JsonResponse({'code':'400','msg':'传输失败'})
    finally:
        connection.close()

#获取客户计划
@csrf_exempt
@require_POST
#获取客户计划
def inquire_dev_plan(request,id):
    try:
         #获取第几页
        page =request.POST.get('page',1)
        page_size=request.POST.get('rows',10)
        
        object_list  = CusDevPlan.objects.values().filter(saleChance=id).order_by('-id')

        #初始化分页对象
        p = Paginator(object_list ,page_size)
        #获取指定页数的数据
        data =p.page(page).object_list  #<class 'django.db.models.query.QuerySet'>

        #返回总条数
        count = p.count

        #准备数据
        context = {
            'total':count,
            'rows':list(data)
        }
        return JsonResponse(context)
    except CusDevPlan.DoesNotExist as e:
        return JsonResponse({'code':'200','msg':'无计划'})

#添加客户计划
@csrf_exempt
@require_POST
def add_dev_plan(request,id):
    try:
        dict = request.POST.dict()  #{'isNewRecord': 'true', 'planDate': '2022-04-19', 
                                    #'planItem': '第一次', 'exeAffect': '还不错'} <class 'dict'>
        isnewrecord = dict.pop('isNewRecord')
        sc =SaleChance.objects.get(pk=id)
        dict['saleChance']= sc
        CusDevPlan.objects.create(**dict)
        return JsonResponse({'code':'200','msg':'添加成功'})
    except EXCEPTION as e:
        return JsonResponse({'code':'400','msg':'添加失败'})

#修改时添加更改日期
@csrf_exempt
@require_POST
def update_dev_plan(request):
    try:
        dict = request.POST.dict()  #{'id': '110', 'saleChance_id': '86', 'planItem': '吃饭', '
                                    #planDate': '2018-10-29T00:00:00', 'exeAffect': '不吃饭', 'isValid': '1', 'createDate': '2018-10-29T18:35:06', 'updateDate': ''}
        id = dict.pop('id')
        dict['updateDate'] =datetime.now()
        CusDevPlan.objects.filter(pk=id).update(**dict)
        return JsonResponse({'code':'200','msg':'添加成功'})
    except EXCEPTION as e:
        return JsonResponse({'code':'400','msg':'添加失败'})

#删除客户计划  逻辑删除 is_valid改为0
@csrf_exempt
@require_POST
def delete_dev_plan(request):
    try:
        dict = request.POST.dict()   #{'id': '113'}
        id = dict.pop('id')
        CusDevPlan.objects.filter(pk=id).update(isValid=0,updateDate=datetime.now())
        return JsonResponse({'code':'200','msg':'添加成功'})
    except Exception as e:
        return JsonResponse({'code':'400','msg':'添加失败'})

#开发成功和开发失败