from datetime import date, datetime,timedelta
import uuid

s = datetime.now()
now_timestamp = str(s.timestamp()).split('.')[0]
print(now_timestamp)