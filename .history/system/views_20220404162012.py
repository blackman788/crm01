from django.shortcuts import render
from django.views.decorators.http import require_POST
# Create your views here.
def login_register(request):
    return render(request,'login_register.html')