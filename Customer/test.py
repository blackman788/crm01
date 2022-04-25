#from system.models import User
from .models import Customer,LinkMan

L_name = LinkMan.objects.values('id','linkName').all()
print(L_name)