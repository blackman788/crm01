from django.shortcuts import render

# Create your views here.
def open_add_server(request):
    return render(request,'server/add_server.html')