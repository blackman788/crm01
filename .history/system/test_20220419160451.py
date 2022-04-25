from datetime import date, datetime,timedelta
import string
import uuid
from hashlib import md5
from random import randint

from crm.settings import DATABASES
""" pwd = 'Aa12345..'
pwd = md5(pwd.encode(encoding='utf-8')).hexdigest()
print(pwd) """
data = datetime.now().strftime('%Y%m%d%H%M%S')
print(data)

result =''
for i in range(0,3):
    result += str(randint(0,9))
print(result)

Khno = 'KH' + data + result
print(Khno)