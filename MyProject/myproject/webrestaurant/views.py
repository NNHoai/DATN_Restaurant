from datetime import datetime
import json
import random
from num2words import num2words
from django.shortcuts import redirect, render
from django.http import HttpResponse, JsonResponse

from .forms import CategoryForm, ProductForm, TableForm
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
def loginstaff(request):
    message = ''
    if request.user.is_authenticated:
        return redirect('staff')
    if request.method == "POST":
        username1 = request.POST.get('username')
        password1 = request.POST.get('password')
        user = authenticate(request, username=username1, password=password1)
        
        if user is not None:
            login(request, user)
            return redirect('staff')
        else:
            message = 'Tài khoản hoặc mật khẩu chưa đúng!'
            
    usercheck = False
    context = {'usercheck' : usercheck, 'message' : message}
    return render(request, 'app/loginstaff.html', context)
def manage(request):
    message = ''
    if request.user.is_authenticated and request.method == "GET":
        n = 0
        categories = Category.objects.all()
        products = Product.objects.all()
        context = {'n': n, 'categories': categories, 'products': products}
        return render(request,'app/managecategory.html',context)
    if request.method == "POST":
        username1 = request.POST.get('username')
        password1 = request.POST.get('password')
        user = authenticate(request, username=username1, password=password1)
        
        if user is not None:
            login(request, user)
            return redirect('manage')
        else:
            message = 'Tài khoản hoặc mật khẩu chưa đúng!'
            
    usercheck = False
    context = {'usercheck' : usercheck, 'message' : message}
    return render(request, 'app/loginstaff.html', context)
def staff(request):
    message = ''
    if request.user.is_authenticated and request.method == "GET":
        tableid = request.GET.get('tableid', '')
        if(tableid == ''):
            tableid = 1
        tables = Table.objects.all()
        products = Product.objects.all()
        categories = Category.objects.all()

        tablebill = Table.objects.get(id=tableid)
        
        bill_query = Bill.objects.filter(id_table=tablebill, status='unpaid')
    
        if (bill_query.exists()  == False):
            bill = Bill.objects.create(status='unpaid')
            bill.id_table.add(tablebill)  
            bill.save()
        else:
            bill = bill_query[0]
        # bill, created = Bill.objects.get_or_create(id_table=tablebill, status='unpaid')
        
        detailbill = DetailBill.objects.filter(bill=bill)
        # for b in bill.id_table.all():
        #     print(b.id)
        #     print(bill.id_table.count())

        tables = Table.objects.all()
        products = Product.objects.all()
        categories = Category.objects.all()
        bill_total_word = num2words(bill.get_bill_total, lang='vi')
        context = {'table' : tablebill, 'tables' : tables, 'products' : products, 'categories' : categories, 'bill' : bill, 'detailbill': detailbill, 'bill_total_word': bill_total_word}
        return render(request, 'app/staff.html', context)
    if request.method == "POST":
        username1 = request.POST.get('username')
        password1 = request.POST.get('password')
        user = authenticate(request, username=username1, password=password1)
        
        if user is not None:
            
            login(request, user)
            return redirect('staff')
        else:
            message = 'Tài khoản hoặc mật khẩu chưa đúng!'
            
    usercheck = False
    context = {'usercheck' : usercheck, 'message' : message}
    return render(request, 'app/loginstaff.html', context)
   
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
# def registerstaff(request):
#     form = CreateUserForm()
#     if request.method == "POST":
#         form = CreateUserForm(request.POST)
#         if form.is_valid():
#             form.save()
#         username = form.cleaned_data['username']
#         name = form.cleaned_data['first_name']
#         email = form.cleaned_data['email']
#         user = User.objects.get(username=username)
#         account = account(user=user, name=name, phone='', email=email, address='')
#         account.save()
#         message = 'Đăng ký thành công. Mời bạn đang nhập!'
#         return redirect('/loginstaff/', message)      
#     context = {'form': form, 'order': order}
#     return render(request, 'app/register.html', context)     
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
    # table = Table.objects.get(id=bill.id_table.id)
    
    tables = bill.id_table.all()


    if check_detail_bill.count() == 0:
        # table.status='Busy'
        for table in tables:
            table.status = 'busy'
            table.save()
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
    
    if check_detail_bill.count() == 0:
        # table.status='empty'
        for table in tables:
            table.status = 'empty'
            table.save()
    bill.save()

    return JsonResponse('updated', safe=False)  

def updatetablebill(request):
    data = json.loads(request.body)
    id_table1 = data['table1']
    id_table2 = data['table2']
    action = data['action']
    # account = request.user.account
    
    table1 = Table.objects.get(id=id_table1)
    if action != 'checkout':
        table2 = Table.objects.get(id=id_table2)

    bill1 = Bill.objects.get(id_table=table1, status = "unpaid")
    
    if action == 'merge':
        
        #change detailbill2 to detailbill1
        bill2 = Bill.objects.get(id_table=table2, status = "unpaid")
        detailbill2 = DetailBill.objects.filter(bill=bill2)
        detailbill2.update(bill=bill1)

        bill2.status = "paid"
        bill2.total_price = 0
        bill2.save()

        # add table2 in bill1
        bill1.id_table.add(table2)
        bill1.total_price = bill1.get_bill_total
        bill1.save()
        # bill1.id_table.remove(table2)

        print('Gộp bàn '+id_table1+' và bàn '+id_table2) 

    elif action == 'change':
        # table2 is empty
        bill2 = Bill.objects.get(id_table=table2, status = "unpaid")

        detailbill1 = DetailBill.objects.filter(bill=bill1)
        detailbill1.update(bill=bill2)

        bill1.total_price = bill1.get_bill_total
        bill1.save()

        bill2.total_price = bill2.get_bill_total
        bill2.save()

        table1.status = "empty"
        table1.save()
        
        table2.status = "busy"
        table2.save()

        print('Chuyển bàn '+id_table1+' sang bàn '+id_table2) 
    
    elif action == 'checkout':

        bill = Bill.objects.get(id_table=table1, status="unpaid")
        bill.status = "paid"
        bill.date_checkout = datetime.datetime.now()
        bill.id_table.all().update(status="empty")
        bill.save()
        print('Thanh toán bàn '+id_table1+' thành công!') 


    return JsonResponse('updated', safe=False)         

def bill(request, pk):
    bill = Bill.objects.get(id=pk)
    detailbill = DetailBill.objects.filter(bill=bill)
    bill_total_word = num2words(bill.get_bill_total, lang='vi').capitalize()
    context = {'bill' : bill, 'detailbill': detailbill, 'bill_total_word': bill_total_word}
    return render(request, 'app/bill.html', context)

# def checkouttable(request):
#     data = json.loads(request.body)
#     id_table = data['table']
#     # account = request.user.account
    
#     table = Table.objects.get(id=id_table)
#     table.status = "empty"
#     table.save()

#     bill = Bill.objects.get(id_table=table, status="unpaid")
#     bill.status = "paid"
#     bill.save()

#     print('Thanh toán bàn '+id_table+' thành công!') 

#     return JsonResponse('Checkout success!', safe=False)      


def manageproduct(request):
    message = ''
    if request.user.is_authenticated and request.method == "GET":
        n = 0
        categories = Category.objects.all()
        products = Product.objects.all()
        context = {'n': n, 'categories': categories, 'products': products}
        return render(request,'app/manageproduct.html',context)
    
    usercheck = False
    context = {'usercheck' : usercheck, 'message' : message}
    return render(request, 'app/loginstaff.html', context)

def addproduct(request):
    form = ProductForm()
    if request.method == 'POST':
        form = ProductForm(request.POST, request.FILES)
        if form.is_valid():
            form.save()
            return redirect('manageproduct')
    context = {"form": form}
    return render(request, 'app/addproduct.html', context)

def updateproduct(request, pk):
    product = Product.objects.get(id=pk)
    
    form = ProductForm(instance=product)

    if request.method == 'POST':
        form = ProductForm(request.POST, request.FILES, instance=product)
        if form.is_valid():
            form.save()
            return redirect('manageproduct')
        
    context = {"form": form}
    return render(request, 'app/updateproduct.html', context)

def deleteproduct(request, pk):
    product = Product.objects.get(id=pk)
    product.delete()
    return redirect('manageproduct')



def addcategory(request):
    form = CategoryForm()
    if request.method == 'POST':
        form = CategoryForm(request.POST)
        if form.is_valid():
            form.save()
            return redirect('manage')
    context = {"form": form}
    return render(request, 'app/addcategory.html', context)

def updatecategory(request, pk):
    category = Category.objects.get(id=pk)
    
    form = CategoryForm(instance=category)

    if request.method == 'POST':
        form = CategoryForm(request.POST, instance=category)
        if form.is_valid():
            form.save()
            return redirect('manage')
        
    context = {"form": form}
    return render(request, 'app/updatecategory.html', context)

def deletecategory(request, pk):
    category = Category.objects.get(id=pk)
    category.delete()
    return redirect('manage')



def managetable(request):
    message = ''
    if request.user.is_authenticated and request.method == "GET":
        tables = Table.objects.all()
        context = {'tables': tables}
        return render(request,'app/managetable.html',context)
            
    usercheck = False
    context = {'usercheck' : usercheck, 'message' : message}
    return render(request, 'app/loginstaff.html', context)

def addtable(request):
    form = TableForm()
    if request.method == 'POST':
        form = TableForm(request.POST)
        if form.is_valid():
            form.save()
            return redirect('managetable')
    context = {"form": form}
    return render(request, 'app/addtable.html', context)

def updatetable(request, pk):
    table = Table.objects.get(id=pk)
    
    form = TableForm(instance=table)

    if request.method == 'POST':
        form = TableForm(request.POST, instance=table)
        if form.is_valid():
            form.save()
            return redirect('managetable')
        
    context = {"form": form}
    return render(request, 'app/updatetable.html', context)

def deletetable(request, pk):
    table = Table.objects.get(id=pk)
    table.delete()
    return redirect('managetable')

def daystatistics(request):
    bills = Bill.objects.all()
    data = []
    data1 = []
    label_data = []
    today = datetime.date.today()
    datestart = today - datetime.timedelta(days=7)
    for i in range(8):
        total_price = 0
        datecheck = datestart + datetime.timedelta(days=i)
        label_data.append(str(datecheck))
        for bill in bills:
            if(bill.date_created.date() == datecheck):
                total_price += bill.total_price
        data.append(int(total_price))
    total_price_week = sum(data)
    text_total = 'Tổng doanh thu từ ngày '+ str(datestart) + ' đến ngày '+ str(today) +': '+ '{:,}'.format(total_price_week) +'đ'
    for i in range(len(data)):
        data1.append(round((data[i]/total_price_week)*100, 1))
    
    total_price_max = max(data)
    day_max = datestart + datetime.timedelta(days=data.index(total_price_max))
    text_max = 'Doanh thu ngày cao nhất ' + str(day_max) + ' : ' + '{:,}'.format(total_price_max) +'đ'
    total_price_min = min(data)
    day_min = datestart + datetime.timedelta(days=data.index(total_price_min))
    text_min = 'Doanh thu ngày thấp nhất ' + str(day_min) + ' : ' + '{:,}'.format(total_price_min) +'đ'
    context = {'label_data': label_data,'data': data, 'data1': data1, 'text_total': text_total, 'text_max': text_max, 'text_min': text_min}
    return render(request, 'app/managetatistics.html', context)

def monthstatistics(request):
    print(datetime.date.today() + datetime.timedelta(days=1))
    bills = Bill.objects.all()
    data = []
    data1 = []
    yearnow = datetime.datetime.now().year
    for i in range(1,13):
        total_price = 0
        for bill in bills:
            if(bill.date_created.year == yearnow and bill.date_created.month == i):
                total_price += bill.total_price
        data.append(int(total_price))
    total_price_year = sum(data)
    text_total = 'Tổng doanh thu năm '+ str(yearnow) + ': '+ '{:,}'.format(total_price_year) +'đ'
    for i in range(len(data)):
        data1.append(round((data[i]/total_price_year)*100, 1))
        
    label_data = ["Tháng 1","Tháng 2","Tháng 3","Tháng 4","Tháng 5","Tháng 6","Tháng 7","Tháng 8","Tháng 9","Tháng 10","Tháng 11","Tháng 12"]
    total_price_max = max(data)
    text_max = 'Doanh thu ngày cao nhất ' + label_data[data.index(total_price_max)] + ' : ' + '{:,}'.format(total_price_max) +'đ'
    total_price_min = min(data)
    text_min = 'Doanh thu tháng thấp nhất ' + label_data[data.index(total_price_min)] + ' : ' + '{:,}'.format(total_price_min) +'đ'
    context = {'label_data': label_data,'data': data, 'data1': data1, 'text_total': text_total, 'text_max': text_max, 'text_min': text_min}
    return render(request, 'app/managetatistics.html', context)