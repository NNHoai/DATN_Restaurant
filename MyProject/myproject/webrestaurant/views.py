from datetime import datetime
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
    tableid = request.GET.get('tableid', '')
    if(tableid == ''):
        tableid = 1
    tables = Table.objects.all()
    products = Product.objects.all()
    categories = Category.objects.all()

    tablebill = Table.objects.get(id=tableid)
    bill, created = Bill.objects.get_or_create(id_table=tablebill, status='unpaid')
    detailbill = DetailBill.objects.filter(bill=bill)

    tables = Table.objects.all()
    products = Product.objects.all()
    categories = Category.objects.all()

    context = {'tables' : tables, 'products' : products, 'categories' : categories, 'bill' : bill, 'detailbill': detailbill}
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
        account = account(user=user, name=name, phone='', email=email, address='')
        account.save()
        message = 'Đăng ký thành công. Mời bạn đang nhập!'
        return redirect('/login/', message)      
    context = {'form': form, 'order': order}
    return render(request, 'app/register.html', context)    
def home(request):
    if request.user.is_authenticated:
        account = request.user.account
        order, created = Order.objects.get_or_create(account=account,complete=False)
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
        account = request.user.account
        order, created = Order.objects.get_or_create(account=account,complete=False)
        
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
        account = request.user.account
        order, created = Order.objects.get_or_create(account=account,complete=False)
        usercheck = True
    else:
        usercheck = False
        order = {'get_cart_items' : 0}
    context = {'categories': categories, 'category': category,'order' : order, 'usercheck': usercheck, "products": products}
    return render(request, 'app/categories.html', context)
def cart(request):
    categories = Category.objects.all()
    if request.user.is_authenticated:
        account = request.user.account
        order, created = Order.objects.get_or_create(account=account, complete = False)
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
    account = request.user.account
    product = Product.objects.get(id=productid)
    order, created = Order.objects.get_or_create(account=account, complete = False)
    orderitem, created = OrderItem.objects.get_or_create(order=order, product=product)
    if action == 'add':
        orderitem.quantity += 1
    elif action == 'remove':
        orderitem.quantity -= 1
    orderitem.save()
    if orderitem.quantity <= 0:
        orderitem.delete()
    return JsonResponse('updated', safe=False)
def checkout(request):
    categories = Category.objects.all()
    if request.user.is_authenticated:
        account = request.user.account
        order, created = Order.objects.get_or_create(account=account, complete = False)
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
        account = request.user.account
        order, created = Order.objects.get_or_create(account=account, complete = False)
        items = order.orderitem_set.all()
    else:
        items = []

        order = {'get_cart_items' : 0, 'get_cart_total' : 0}
    productid = request.GET.get('productid', '')
    product = Product.objects.get(id = productid)
    context = { 'categories' : categories, 'items': items, 'order' : order, 'product' : product } 
    return render(request, 'app/detail.html', context)                                                                                                                                                                                                                                                                                                                                                                                       

# def choosetable(request):
#     data = json.loads(request.body)
#     tableid = data['tableid']
#     # account = request.user.account
#     table = Table.objects.get(id=int(tableid))
#     bill, created = Bill.objects.get_or_create(id_table=table, status = 'Unpaid')
#     detailbill = DetailBill.objects.filter(bill=bill)
#     tables = Table.objects.all()
#     products = Product.objects.all()
#     categories = Category.objects.all()

#     context = {'tables' : tables, 'products' : products, 'categories' : categories, 'bill' : bill, 'detailbill': detailbill}
#     return render(request, 'app/staff.html', context) 

def updatebill(request):
    data = json.loads(request.body)
    billid = data['billid']
    productid = data['productid']
    action = data['action']
    # account = request.user.account

    product = Product.objects.get(id=productid)
    bill = Bill.objects.get(id=billid)
    
    check_detail_bill = DetailBill.objects.filter(bill=bill)
    table = Table.objects.get(id=bill.id_table.id)
    print(table.status) 
    if check_detail_bill.count() == 0:
        table.status='Busy'
        bill.date_created = datetime.now()

    detailbill, created = DetailBill.objects.get_or_create(bill=bill, product=product)

    if action == 'add':
        detailbill.quantity += 1
    elif action == 'remove':
        detailbill.quantity -= 1
    detailbill.save()
    if detailbill.quantity <= 0:
        detailbill.delete()
    
    bill.total_price = bill.get_bill_total
    bill.save()
    
    if check_detail_bill.count() == 0:
        table.status='empty'
    table.save()
    print(table.status) 
    return JsonResponse('updated', safe=False)  

def updatetable(request):
    data = json.loads(request.body)
    id_table1 = data['table1']
    id_table2 = data['table2']
    action = data['action']
    # account = request.user.account
    
    table1 = Table.objects.get(id=id_table1)
    table2 = Table.objects.get(id=id_table2)

    if action == 'merge':
        # dskjnn
        print('Gộp bàn '+id_table1+' và bàn '+id_table2) 

    elif action == 'change':
        # # table2 is empty
        # bill2 = Bill.objects.get(id_table=table1)
        # bill2.id_table = table2
        # bill2.save()
        print('Chuyển bàn '+id_table1+' sang bàn '+id_table2) 

    
    return JsonResponse('updated', safe=False)         