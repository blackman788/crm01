from datetime import date, datetime,timedelta
t = timedelta(minutes=10)
s = datetime.now() + t
s = s.timestamp()
print(s)