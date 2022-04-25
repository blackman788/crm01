import contextlib
from hashlib import md5
import imp
from django.shortcuts import redirect, render
from django.views.decorators.http import require_POST,require_GET
from pymysql import Timestamp
from .models import User
from django.http import HttpResponse, JsonResponse
from email.header import Header #对中文进行编码
from email.mime.text import MIMEText  #邮件对象
from email.utils import parseaddr,formataddr #格式化邮箱
import smtplib #发送邮件
from datetime import date, datetime,timedelta
import uuid
import base64
# Create your views here.
def login_register(request):
    return render(request,'system/login_register.html')


#验证用户名是否唯一
@require_POST
def check_username(request):
    try:
        username = request.POST.get('username')

        #获取数据库
        user = User.objects.get(username=username)

        return JsonResponse({'code':'400','msg':'用户名已存在,请重新输入'})
    except User.DoesNotExist as e:
        return JsonResponse({'code':'200','msg':'用户名可以注册'})
    

#验证邮箱是否唯一
def check_email(request):
    try:
        email = request.POST.get('email')

        #获取数据库
        eml = User.objects.get(email=email)

        return JsonResponse({'code':'400','msg':'该邮箱已存在,请重新输入'})
    except User.DoesNotExist as e:
        return JsonResponse({'code':'200','msg':'该邮箱可注册'})

#发送邮箱
#格式化邮箱
def foramt_addr(s):
    name,addr = parseaddr(s)
    return formataddr((Header(name,'utf-8').encode('utf-8'),addr))

@require_POST
def send_email(request):
    try:
        username = request.POST.get('username')
        email = request.POST.get('email')
        pwd = request.POST.get('password')
        #md5加密
        pwd = md5(pwd.encode(encoding='utf-8')).hexdigest()
        #获取十分钟后的时间戳
        t = timedelta(minutes=10)
        s = datetime.now() + t
        timestamp = str(s.timestamp()).split('.')[0]
        #获取uuid随机名
        code =''.join(str(uuid.uuid4()).split('-')) 
        from_addr = 'yxk75115513@163.com'    #发件人
        password = 'AMFYBBBMZYEQDPLK'     #授权码
        smtp_server = 'smtp.163.com'  #服务器地址
        to_addr = email #收件人

        html ="""
                <html>
                    <body>
                            尊敬的用户,请前往激活账号<a href="http://127.0.0.1:8000/system/active_username/?username={0}&code={1}&timestamp={2}">127.0.0.1:8000/system/active_username/?username={0}&amp;code={1}&amp;timestamp={2}</a>
                    </body>
                <html>
            """.format(username,code,timestamp)
        #构建一个发送内容对象
        msg = MIMEText(html,"html","utf-8")
        #标准邮件三大头部信息:From   TO   Subject
        msg['From'] = foramt_addr(u'网易邮箱<%s>'%from_addr) #发件人
        to_name = 'blackman788'
        msg['To'] = foramt_addr(u'{}<%s>'.format(to_name)%to_addr)
        msg['Subject'] = Header(u'crm管理端注册信息','utf-8').encode('utf-8') #标题

        #数据库插入数据
        u = User(username=username,password=pwd,email=email,code=code,timestamp=timestamp)
        u.save()

        #创建发送邮件服务器的对象
        server = smtplib.SMTP(smtp_server,25)#网易邮箱stmp服务器默认端口25
        server.set_debuglevel(1) #是否显示发送日志 1显示 0不显示
        server.login(from_addr,password) #登录邮箱
        server.sendmail(from_addr,[to_addr],msg.as_string()) #发送邮件
        server.quit() #关闭发送

        return JsonResponse({'code':'200','msg':'注册成功'})
    except smtplib.SMTPException as e:
        return JsonResponse({'code':'400','msg':'注册失败,请重新尝试'})

#激活账号
@require_GET
def active_username(request):
    try:
        username = request.GET.get('username')
        code = request.GET.get('code')
        timestamp = request.GET.get('timestamp')

        #对比数据 查询是否有该用户
        user = User.objects.get(username=username,code=code,timestamp=timestamp)

        #对比时间戳
        s = datetime.now()
        now_timestamp = int(str(s.timestamp()).split('.')[0])
        if(now_timestamp > int(timestamp)):
            #如果超时，链接失效
            user.delete()
            return HttpResponse('链接已超时,请重新注册<a href="http://127.0.0.1:8000/system/login_register/">127.0.0.1:8000/system/login_register/</a>')
        
        #若无超时，删除激活码，修改status为 1 
        user.code = ''
        user.status = 1
        user.save()

        return HttpResponse('注册成功,请跳转页面登录<a href="http://127.0.0.1:8000/system/login_register/">127.0.0.1:8000/system/login_register/</a>')
    except Exception as e:
        if (isinstance(e,User.DoesNotExist)):
            return HttpResponse('链接已超时,请重新注册<a href="http://127.0.0.1:8000/system/login_register/">127.0.0.1:8000/system/login_register/</a>')
        return HttpResponse('不好意思网络出现波动,请重新注册')

#登录页面
@require_POST
def login_user(request):
    try:
        #验证用户信息
        username = request.POST.get('username')
        password03 = request.POST.get('password')
        remember = request.POST.get('remember')
        #md5加密
        pwd = md5(password03.encode(encoding='utf-8')).hexdigest()
        cont =  username + "&" +password03
        user = User.objects.get(username=username,password=pwd)

        request.session['user_name']=username
        request.session.set_expiry(0)

        if 'true' == remember:
            content={'code':400,
                    'msg':'请点击登录',
                    'login_cookies':cont,

            }
            return JsonResponse(content)
        return JsonResponse({'code':400,'msg':'请点击登录'})
    except User.DoesNotExist as e:
        return JsonResponse({'code':200,'msg':'用户名或密码错误'})

def index(request):
    user = request.session.get('user_name')
    if user:
        return render(request,'system/index.html')

    return redirect('system:login_register')

@require_POST
def update_password(request):
    try:
        username = request.POST.get('reusername')
        password=request.POST.get('password')
        pwd = md5(password.encode(encoding='utf-8')).hexdigest()
        newpassword = request.POST.get('newpassword')

        #md5加密
        pwd1 = md5(newpassword.encode(encoding='utf-8')).hexdigest()

        #比对数据库
        user = User.objects.get(username=username,password=pwd)

        #对比成功则修改
        user.password = pwd1
        user.save()

        #删除session
        request.sessions.flush()

        return JsonResponse({'code':200,'msg':'修改成功'})
    except Exception as e:
        return JsonResponse({'code':400,'msg':'修改失败,密码不正确'})


    