from ast import DictComp, If
from http.client import EXPECTATION_FAILED
import imp
import json
from multiprocessing import context
from pickle import DICT
from re import ASCII, U
from urllib import request
from django.http import JsonResponse
from django.shortcuts import render
from Customer.models import Customer,LinkMan,Contact,CustomerOrders,OrdersDetail,CustomerLoss,CustomerReprieve
from SaleChance.models import SaleChance
from system.models import User
from django.core.exceptions import ObjectDoesNotExist
from datetime import datetime
from django.views.decorators.http import require_GET,require_POST
from django.views.decorators.csrf import csrf_exempt
from django.core.paginator import Paginator
from django.views.decorators.csrf import csrf_exempt
from random import randint
from base.models import DataDic
# Create your views here.


#添加营销机会
def add_sales(requset):
    try:
        #获取 所有  联系人
        #L_name = LinkMan.objects.values('id','linkName').all()
        L_name = LinkMan.objects.values('id','linkName').all()
        #获取 所有 客户名称
        c_name = Customer.objects.values('id','name').all()
        #获取 所有 指派人 (用户)
        u_name = User.objects.values('id','username').all()

        # 返回数据
        context = {
            'code': 200,
            'msg': 'success',
            'cs': list(c_name),  #用dict只能取到{'id': 'linkName'}  键值对需要保存在list内
            'ls': list(L_name),
            'us': list(u_name)
        }
        return JsonResponse(context)
    except ObjectDoesNotExist as e:
        return JsonResponse({'code': 400,'msg': 'error'})


#自动添加联系人电话    
def add_phone(request):
    try:
        i = request.GET.get('id')
        phone = LinkMan.objects.get(pk=i)
        
        context={
            'code':200,
            'msg':'传输成功',
            'phone':phone.phone
        }
        return JsonResponse(context)
    except Exception as e:
        return JsonResponse({
            'code':400,
            'msg':'error'
        })


#提交添加营销机会管理表单
def add_sumbit(request):
    try:
        #获取框中所有值
        customerId = request.POST.get('customerId').strip() #取到id
        customerName = request.POST.get('customerName_hidden').strip()
        chanceSource = request.POST.get('chanceSource').strip()
        linkMan = request.POST.get('linkMan').strip() #取到id
        linkManName = request.POST.get('linkManName').strip()
        linkPhone = request.POST.get('linkPhone').strip()
        cgjl = request.POST.get('cgjl').strip()
        overview = request.POST.get('overview').strip()
        description = request.POST.get('description').strip()
        username = request.POST.get('username').strip()#取到id
        #如果有联系人 还需要添加联系人表
        """ if linkMan:
             lm = LinkMan(customer=customerId,linkName=linkManName,phone=linkPhone,isValid=1)
             lm.save() """

        #如果有指派人 添加
        if username is not '0':
            U = SaleChance(customerId=customerId,customerName=customerName,chanceSource=chanceSource,
                            linkMan=linkMan,linkPhone=linkPhone,cgjl=cgjl,overview=overview,
                            description=description,assignMan=username,assignTime=datetime.now(),state=1,
                            devResult=0,createMan=request.session.get('user_name')
            )
        else:
            U = SaleChance(customerId=customerId,customerName=customerName,chanceSource=chanceSource,
                            linkMan=linkMan,linkPhone=linkPhone,cgjl=cgjl,overview=overview,
                            description=description,state=0,
                            devResult=0,createMan=request.session.get('user_name')
            )
        U.save()
        return JsonResponse({'code': 200, 'msg': '添加成功'})
    except Exception as e:
        return JsonResponse({'code': 400, 'msg': '添加失败'})


#--------------------------------客户信息管理----------------------start-----------------------
def sale_cus_detail_index(request):
    """ 跳转客户信息 """
    return render(request,'Customer/cus_detail.html')

@csrf_exempt
@require_POST
def inquire_cus_detail(request):
    """ 查询计划 """
    try:
        #获取第几页
        page =request.POST.get('page')
        page_size=request.POST.get('rows')

        #返回多条结果行
        object_list = Customer.objects.values().all().order_by('-id')
        
        name = request.POST.get('name')
        khno = request.POST.get('khno')
        state = request.POST.get('state')

        if name:
            object_list = object_list.filter(name__icontains=name)

        if khno:
            object_list = object_list.filter(khno__icontains=khno)

        if state:
            object_list = object_list.filter(state=state)
            
        #初始化分页对象
        p = Paginator(object_list,page_size)
        #获取指定页数的数据
        data =p.page(page).object_list 
        #返回总条数
        count = p.count

        #准备数据
        context = {
            'total':count,
            'rows':list(data)
        }
        return JsonResponse(context)
    except Exception as e:
        print(e)
        return JsonResponse({'code':'400','msg':'传输失败'})

@require_GET
def add_cus_detail(request):
    try:
        dict = request.GET.dict()
        level = dict.pop('level')
        v = DataDic.objects.values('dataDicValue').filter(id=level)
        dict['level'] =(v[0])['dataDicValue']

        result =''
        for i in range(0,3):
            result += str(randint(0,9))
        khno = 'KH' + datetime.now().strftime('%Y%m%d%H%M%S') + result
        dict['khno'] = khno
        Customer.objects.create(**dict)
        return JsonResponse({'code':'200','msg':'添加成功'})
    except Exception as e:
        return JsonResponse({'code':'400','msg':'添加失败'})

@require_GET
#返显修改框数据
def back_cus_detail(request):
    try:
        id = request.GET.get('id')
        v = Customer.objects.values().get(pk=id)
        return JsonResponse({'code':'200','msg':'返显成功','data':v})
    except Exception as e:
        return JsonResponse({'code':'400','msg':'返显失败'})

@require_GET
def update_cus_detail(request):
    try:
        dict = request.GET.dict()
        id = dict.pop('id')
        Customer.objects.filter(pk=id).update(**dict,updateDate=datetime.now())
        return JsonResponse({'code':'200','msg':'修改成功'})
    except Exception as e:
        return JsonResponse({'code':'400','msg':'修改失败'})


@require_GET
def delete_cus_detail(request):
    try:
        id = request.GET.get('ids') #  '140,124,80' 
         # 分割字符串
        ids = id.split(',')
        print(ids)
        # 删除
        Customer.objects.filter(pk__in=ids).update(isValid=0, updateDate=datetime.now())
        return JsonResponse({'code':'200','msg':'删除成功'})
    except Exception as e:
        return JsonResponse({'code':'400','msg':'删除失败'})
#--------------------------------客户信息管理----------------------end----------------------

#--------------------------------客户联系人管理----------------------start----------------------
@require_GET
def inquire_linkman_detail(request):
    id = request.GET.get('id')
    c = Customer.objects.get(pk=id)
    return render(request,'Customer/linkman_detail.html',{'code':'200','msg':'查询成功','c':c})

@csrf_exempt
@require_POST
def linkman_detail(request,id):
    #获取第几页
        page =request.POST.get('page')
        page_size=request.POST.get('rows')

        #返回多条结果行
        c=Customer.objects.get(pk=id)   #LinkMan表的customer是外键关联 需用表来查询
        object_list = LinkMan.objects.values().filter(customer=c).order_by('-id')
            
        #初始化分页对象
        p = Paginator(object_list,page_size)
        #获取指定页数的数据
        data =p.page(page).object_list 
        #返回总条数
        count = p.count

        #准备数据
        context = {
            'total':count,
            'rows':list(data)
        }
        return JsonResponse(context)

@csrf_exempt
@require_POST
def add_linkman_detail(request,id):
    try:
        dict = request.POST.dict()
        isNewRecord = dict.pop('isNewRecord')
        ids = Customer.objects.get(pk=id)
        dict['customer']=ids
        LinkMan.objects.create(**dict,updateDate=datetime.now())
        return JsonResponse({'code':'200','msg':'添加成功'})
    except Exception as e:
        return JsonResponse({'code':'400','msg':'添加失败'})

@csrf_exempt
@require_POST
def update_linkman_detail(request):
    try:
        dict = request.POST.dict()
        id = dict.pop('id')
        dict['updateDate'] = datetime.now()
        LinkMan.objects.filter(pk=id).update(**dict)
        return JsonResponse({'code':'200','msg':'修改成功'})
    except Exception as e:
        return JsonResponse({'code':'400','msg':'修改失败'})


@csrf_exempt
@require_POST
def delete_linkman_detail(request):
    try:
        id = request.POST.get('id') #  '140,124,80' 
        # 逻辑删除
        LinkMan.objects.filter(pk=id).update(isValid=0)
        return JsonResponse({'code':'200','msg':'删除成功'})
    except Exception as e:
        return JsonResponse({'code':'400','msg':'删除失败'})
    
#--------------------------------客户联系人管理----------------------end----------------------

#--------------------------------客户交往记录----------------------start----------------------
@require_GET
def inquire_contact_detail(request):
    id = request.GET.get('id')
    c = Customer.objects.get(pk=id)
    return render(request,'Customer/contact.html',{'code':'200','msg':'查询成功','c':c})

@csrf_exempt
@require_POST
def contact_detail(request,id):
    #获取第几页
        page =request.POST.get('page')
        page_size=request.POST.get('rows')

        #返回多条结果行
        c=Customer.objects.get(pk=id)   #LinkMan表的customer是外键关联 需用表来查询
        object_list = Contact.objects.values().filter(customer=c).order_by('-id')
            
        #初始化分页对象
        p = Paginator(object_list,page_size)
        #获取指定页数的数据
        data =p.page(page).object_list 
        #返回总条数
        count = p.count

        #准备数据
        context = {
            'total':count,
            'rows':list(data)
        }
        return JsonResponse(context)

@csrf_exempt
@require_POST
def add_contact_detail(request,id):
    try:
        dict = request.POST.dict()
        isNewRecord = dict.pop('isNewRecord')
        ids = Customer.objects.get(pk=id)
        dict['customer']=ids
        Contact.objects.create(**dict,createDate=datetime.now())
        return JsonResponse({'code':'200','msg':'添加成功'})
    except Exception as e:
        return JsonResponse({'code':'400','msg':'添加失败'})

@csrf_exempt
@require_POST
def update_contact_detail(request):
    try:
        dict = request.POST.dict()
        id = dict.pop('id')
        customer_id = dict.pop('customer_id')
        dict['updateDate'] = datetime.now()
        Contact.objects.filter(pk=id).update(**dict)
        return JsonResponse({'code':'200','msg':'修改成功'})
    except Exception as e:
        return JsonResponse({'code':'400','msg':'修改失败'})


@csrf_exempt
@require_POST
def delete_contact_detail(request):
    try:
        id = request.POST.get('id') #  '140,124,80' 
        # 逻辑删除
        Contact.objects.filter(pk=id).update(isValid=0,updateDate=datetime.now())
        return JsonResponse({'code':'200','msg':'删除成功'})
    except Exception as e:
        return JsonResponse({'code':'400','msg':'删除失败'})
#--------------------------------客户交往记录----------------------end----------------------

#--------------------------------客户历史订单查询----------------------start----------------------

@require_GET
def inquire_order(request):
    id = request.GET.get('id')
    c = Customer.objects.get(pk=id)
    return render(request,'Customer/order.html',{'code':'200','msg':'查询成功','c':c})

@csrf_exempt
@require_POST
def gain_order(request,id):
    #获取第几页
        page =request.POST.get('page')
        page_size=request.POST.get('rows')

        #返回多条结果行
        c=Customer.objects.get(pk=id)   #LinkMan表的customer是外键关联 需用表来查询
        object_list = CustomerOrders.objects.values().filter(customer=c).order_by('-id')
            
        #初始化分页对象
        p = Paginator(object_list,page_size)
        #获取指定页数的数据
        data =p.page(page).object_list 
        #返回总条数
        count = p.count

        #准备数据
        context = {
            'total':count,
            'rows':list(data)
        }
        return JsonResponse(context)
    
def back_order_detail(request):
    try:
        id = request.GET.get('id')
        v = CustomerOrders.objects.values().get(pk=id)
        return JsonResponse({'code':'200','msg':'返显成功','data':v})
    except Exception as e:
        return JsonResponse({'code':'400','msg':'返显失败'})

@csrf_exempt
@require_POST
def order_detai(request,id):
    #获取第几页
        page =request.POST.get('page')
        page_size=request.POST.get('rows')

        #返回多条结果行
        object_list = OrdersDetail.objects.values().filter(order=id).order_by('-id')
            
        #初始化分页对象
        p = Paginator(object_list,page_size)
        #获取指定页数的数据
        data =p.page(page).object_list 
        #返回总条数
        count = p.count

        #准备数据
        context = {
            'total':count,
            'rows':list(data)
        }
        return JsonResponse(context)
#--------------------------------客户历史订单查询----------------------end----------------------

#--------------------------------客户流失情况----------------------start----------------------
@require_GET
def inquire_loss(request):
    return render(request,'Customer/loss.html')

@csrf_exempt
@require_POST
def loss_detail(request):
    #获取第几页
        page =request.POST.get('page')
        page_size=request.POST.get('rows')

        #返回多条结果行
        object_list = CustomerLoss.objects.values().order_by('-cusNo')
            
        cusName = request.POST.get('cusName')
        cusManager =request.POST.get('cusManager')
        state =request.POST.get('state')

        if cusName:
            object_list = object_list.filter(cusName=cusName)
        if cusManager:
            object_list = object_list.filter(cusManager=cusManager)
        if state:
            object_list = object_list.filter(state=state)

        #初始化分页对象
        p = Paginator(object_list,page_size)
        #获取指定页数的数据
        data =p.page(page).object_list 
        #返回总条数
        count = p.count

        #准备数据
        context = {
            'total':count,
            'rows':list(data)
        }
        return JsonResponse(context)

@require_GET
def inquire_reprieve(request):
    id = request.GET.get('id')
    c = CustomerLoss.objects.get(pk=id)
    return render(request,'Customer/reprieve.html',{'code':'200','msg':'查询成功','cl':c})


@csrf_exempt
@require_POST
def reprieve_detail(request,id):
   # 获取第几页
    page_num = request.POST.get('page', 1)  # 添加默认值，防止没有参数导致的异常错误

    # 获取每页多少条
    page_size = request.POST.get('rows', 10)  # 添加默认值，防止没有参数导致的异常错误

    # 查询
    cl = CustomerLoss.objects.get(pk=id)
    object_list = CustomerReprieve.objects.values().filter(customerLoss=cl).order_by('-id')

    # 初始化分页对象
    p = Paginator(object_list, page_size)

    # 获取指定页数的数据
    data = p.page(page_num).object_list

    # 返回总条数
    count = p.count

    # 返回数据
    context = {
        'total': count,
        'rows': list(data)
    }
    return JsonResponse(context)

@csrf_exempt
@require_POST
def add_reprieve_detail(request,id):
    try:
        dict = request.POST.dict()
        isNewRecord = dict.pop('isNewRecord')
        cl = CustomerLoss.objects.get(pk=id)
        dict['customerLoss']=cl
        CustomerReprieve.objects.create(**dict,createDate=datetime.now())
        return JsonResponse({'code':'200','msg':'添加成功'})
    except Exception as e:
        return JsonResponse({'code':'400','msg':'添加失败'})

@csrf_exempt
@require_POST
def update_reprieve_detail(request):
    try:
        dict = request.POST.dict()
        id = dict.pop('id')
        dict['updateDate'] = datetime.now()
        CustomerReprieve.objects.filter(pk=id).update(**dict)
        return JsonResponse({'code':'200','msg':'修改成功'})
    except Exception as e:
        return JsonResponse({'code':'400','msg':'修改失败'})


@csrf_exempt
@require_POST
def delete_reprieve_detail(request):
    try:
        id = request.POST.get('id') #  '140,124,80' 
        # 逻辑删除
        CustomerReprieve.objects.filter(pk=id).update(isValid=0,updateDate=datetime.now())
        return JsonResponse({'code':'200','msg':'删除成功'})
    except Exception as e:
        return JsonResponse({'code':'400','msg':'删除失败'})
#--------------------------------客户流失情况----------------------end------------------------

