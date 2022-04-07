from django.shortcuts import render

# Create your views here.
def login_register(request):
    return render(request,'login_register.html')