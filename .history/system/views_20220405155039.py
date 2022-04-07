import imp
from django.shortcuts import render
from django.views.decorators.http import require_POST
from .models import User
from django.http import JsonResponse
from email.header import Header #对中文进行编码
from email.mime.text import MIMEText  #邮件对象
from email.utils import parseaddr,formataddr #格式化邮箱
import smtplib #发送邮件
from datetime import date, datetime,timedelta
# Create your views here.
def login_register(request):
    return render(request,'login_register.html')


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
    username = request.POST.get('username')

    from_addr = 'yxk75115513@163.com'    #发件人
    password = 'AMFYBBBMZYEQDPLK'     #授权码
    smtp_server = 'smtp.163.com'  #服务器地址
    to_addr = input('收件人邮箱:') #收件人

    html ='''
        <html>
            <body>
                    尊敬的用户,请前往激活账号<a href="http://127.0.0.1:8000/system/login_register/?username={a}&code={b}&timestamp={c}}">127.0.0.1:8000/system/login_register/?username={a}&code={b}}&timestamp={c}}</a>
            </body>
        <html>
        '''.format(a=username,b=code,c=timestamp)
    #构建一个发送内容对象
    msg = MIMEText(html,"html","utf-8")
    #标准邮件三大头部信息:From   TO   Subject
    msg['From'] = foramt_addr(u'网易邮箱<%s>'%from_addr) #发件人
    to_name = input('收件人名称:')
    msg['To'] = foramt_addr(u'{}<%s>'.format(to_name)%to_addr)
    msg['Subject'] = Header(u'python学习资料','utf-8').encode('utf-8') #标题


    #创建发送邮件服务器的对象
    server = smtplib.SMTP(smtp_server,25)#网易邮箱stmp服务器默认端口25
    server.set_debuglevel(1) #是否显示发送日志 1显示 0不显示
    server.login(from_addr,password) #登录邮箱
    server.sendmail(from_addr,[to_addr],msg.as_string()) #发送邮件
    server.quit() #关闭发送