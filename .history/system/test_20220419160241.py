from datetime import date, datetime,timedelta
import uuid
from hashlib import md5
from random import randint
""" pwd = 'Aa12345..'
pwd = md5(pwd.encode(encoding='utf-8')).hexdigest()
print(pwd) """
data = datetime.now().strftime('%Y%m%d%H%M%S')
print(data)

str =''
for i in range(0,3):
    str += randint(0,3)
print(str)