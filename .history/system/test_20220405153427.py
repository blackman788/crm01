from email.header import Header #对中文进行编码
from email.mime.text import MIMEText  #邮件对象
from email.utils import parseaddr,formataddr #格式化邮箱
import smtplib #发送邮件

#格式化邮箱(不格式化会被当成垃圾邮件去发送或者发送失败)
#函数一般位置放于调用代码之前
def foramt_addr(s):
    name,addr = parseaddr(s)
    return formataddr((Header(name,'utf-8').encode('utf-8'),addr))

#准备数据
from_addr = 'yxk75115513@163.com'    #发件人
password = 'AMFYBBBMZYEQDPLK'     #授权码
smtp_server = 'smtp.163.com'  #服务器地址
to_addr = input('收件人邮箱:') #收件人

html ='''
       <html>
          <body>
                尊敬的用户,请前往激活账号<a href="http://127.0.0.1:8000/system/login_register/?username=username&code=code&timestamp=timestamp">127.0.0.1:8000/system/login_register/?username=username&code=code&timestamp=timestamp</a>
        </body>
       <html>
       '''
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