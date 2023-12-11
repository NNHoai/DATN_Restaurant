import json
import random
from django.shortcuts import redirect, render
from django.http import HttpResponse, JsonResponse
from .models import *
from django.contrib.auth.forms import UserCreationForm
from django.contrib.auth import authenticate, login, logout
from django.contrib import messages

# Create your views here.
def loginpage(request):
    message = ''
    order = {'get_cart_items' : 0}
    if request.user.is_authenticated:
        return redirect('home')
    if request.method == "POST":
        username1 = request.POST.get('username')
        password1 = request.POST.get('password')
        user = authenticate(request, username=username1, password=password1)
        
        if user is not None:
            
            login(request, user)
            return redirect('home')
        else:
            message = 'Tài khoản hoặc mật khẩu chưa đúng!'
            
    usercheck = False
    context = {'usercheck' : usercheck, 'message' : message, 'order': order}
    return render(request, 'app/login.html', context)
def manage(request):
    message = ''
    order = {'get_cart_items' : 0}
    if request.user.is_authenticated:
        return redirect('home')
    if request.method == "POST":
        username1 = request.POST.get('username')
        password1 = request.POST.get('password')
        user = authenticate(request, username=username1, password=password1)
        
        if user is not None:
            login(request, user)
            return redirect('home')
        else:
            message = 'Tài khoản hoặc mật khẩu chưa đúng!'
            
    usercheck = False
    context = {'usercheck' : usercheck, 'message' : message, 'order': order}
    return render(request, 'app/manage.html', context)
def staff(request):
    products = Product.objects.all()
    categories = Category.objects.all()
    context = {'products' : products, 'categories' : categories}
    return render(request, 'app/staff.html', context)
def logoutpage(request):
    logout(request)
    return redirect('login')
def register(request):
    form = CreateUserForm()
    order = {'get_cart_items' : 0}
    if request.method == "POST":
        form = CreateUserForm(request.POST)
        if form.is_valid():
            form.save()
        username = form.cleaned_data['username']
        name = form.cleaned_data['first_name']
        email = form.cleaned_data['email']
        user = User.objects.get(username=username)
        customer = Customer(user=user, name=name, phone='', email=email, address='')
        customer.save()
        message = 'Đăng ký thành công. Mời bạn đang nhập!'
        return redirect('/login/', message)      
    context = {'form': form, 'order': order}
    return render(request, 'app/register.html', context)    
def home(request):
    if request.user.is_authenticated:
        customer = request.user.customer
        order, created = Order.objects.get_or_create(customer=customer,complete=False)
        usercheck = True
    else:
        usercheck = False
        order = {'get_cart_items' : 0}
    categories = Category.objects.all()
    products = Product.objects.all()
    topproducts = []
    for i in range(3):
        random_idx = random.randint(0, Product.objects.count() - 1)
        product_random = Product.objects.all()[random_idx]
        topproducts.append(product_random)
    context = {'usercheck': usercheck,'products' : products, 'categories' : categories, 'order' : order, 'topproducts': topproducts} 
    return render(request, 'app/home.html', context)                                                                                                                                                                                                                                                                                                                      
def search(request):
    categories = Category.objects.all()
    order = {'get_cart_items' : 0}
    if request.method == 'POST':
        searchkey = request.POST['searchkey']
        keys = Product.objects.filter(name__icontains = searchkey)
    if request.user.is_authenticated:
        customer = request.user.customer
        order, created = Order.objects.get_or_create(customer=customer,complete=False)
        
        usercheck = True
    else:
        usercheck = False
        order = {'get_cart_items' : 0}
    context = {'categories': categories, 'order' : order, 'usercheck': usercheck, "searchkey": searchkey, "keys": keys}
    return render(request, 'app/search.html', context)                                                                                                                                                                                                                                                                                                                                    

def categories(request):
    categories = Category.objects.all()
    order = {'get_cart_items' : 0}
    categoryid = request.GET.get('categoryid','')
    category = Category.objects.get(id=categoryid)
    products = Product.objects.filter(Category=category)
    if request.user.is_authenticated:
        customer = request.user.customer
        order, created = Order.objects.get_or_create(customer=customer,complete=False)
        usercheck = True
    else:
        usercheck = False
        order = {'get_cart_items' : 0}
    context = {'categories': categories, 'category': category,'order' : order, 'usercheck': usercheck, "products": products}
    return render(request, 'app/categories.html', context)
def cart(request):
    categories = Category.objects.all()
    if request.user.is_authenticated:
        customer = request.user.customer
        order, created = Order.objects.get_or_create(customer=customer, complete = False)
        items = order.orderitem_set.all()
    else:
        items = []
        order = {'get_cart_items' : 0, 'get_cart_total' : 0}
    context = { 'categories' : categories, 'items': items, 'order' : order } 
    return render(request, 'app/cart.html', context)                                                                                                                                                                                                                                                                                                                                                                               
def updateitem(request):
    data = json.loads(request.body)
    productid = data['productid']
    action = data['action']
    customer = request.user.customer
    product = Product.objects.get(id=productid)
    order, created = Order.objects.get_or_create(customer=customer, complete = False)
    orderitem, created = OrderItem.objects.get_or_create(order=order, product=product)
    if action == 'add':
        orderitem.quantity += 1
    elif action == 'remove':
        orderitem.quantity -= 1
    orderitem.save()
    if orderitem.quantity <= 0:
        orderitem.delete()
    return JsonResponse('added', safe=False)
def checkout(request):
    categories = Category.objects.all()
    if request.user.is_authenticated:
        customer = request.user.customer
        order, created = Order.objects.get_or_create(customer=customer, complete = False)
        items = order.orderitem_set.all()
        if request.method == "POST":
            username1 = request.POST.get('username')
            password1 = request.POST.get('password')
    else:
        items = []
        order = {'get_cart_items' : 0, 'get_cart_total' : 0}
    context = { 'categories' : categories, 'items': items, 'order' : order } 
    return render(request, 'app/checkout.html', context) 
def detail(request):
    categories = Category.objects.all()
    if request.user.is_authenticated:
        customer = request.user.customer
        order, created = Order.objects.get_or_create(customer=customer, complete = False)
        items = order.orderitem_set.all()
    else:
        items = []
        order = {'get_cart_items' : 0, 'get_cart_total' : 0}
    productid = request.GET.get('productid', '')
    product = Product.objects.get(id = productid)
    context = { 'categories' : categories, 'items': items, 'order' : order, 'product' : product } 
    return render(request, 'app/detail.html', context)                                                                                                                                                                                                                                                                                                                                                                                                    