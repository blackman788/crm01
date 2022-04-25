from datetime import date, datetime,timedelta
import uuid
from hashlib import md5
""" pwd = 'Aa12345..'
pwd = md5(pwd.encode(encoding='utf-8')).hexdigest()
print(pwd) """
data = datetime.now().strftime('%Y%m%d%H%M%S')
print(data)