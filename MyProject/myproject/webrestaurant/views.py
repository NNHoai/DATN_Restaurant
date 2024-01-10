# from datetime import datetime, date
import datetime
import hashlib
import hmac
import json
import math
from operator import itemgetter
import random
from django.conf import settings
from num2words import num2words
from django.shortcuts import redirect, render
from django.http import HttpResponse, JsonResponse
from django.contrib.auth.decorators import login_required
import requests
# import requests
from .vnpay import vnpay

from .forms import AccountForm, CategoryForm, CreateUserForm, InfoBookingForm, PaymentForm, ProductForm, TableForm
from .models import *
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

    context = {'message' : message, 'order': order, 'title': "Đăng nhập"}
    return render(request, 'app/login.html', context)

def loginstaff(request):
    message = ''
    if request.user.is_authenticated:
        type = Account.objects.get(user=request.user).type
        if type == 'ADMIN':
            return redirect('manage')
        elif type == 'EMPLOYEE':
            return redirect('staff')
    if request.method == "POST":
        username1 = request.POST.get('username')
        password1 = request.POST.get('password')
        user = authenticate(request, username=username1, password=password1)
        
        if user is not None:
            login(request, user)
            type = Account.objects.get(user=request.user).type
            print(type)
            if type == 'ADMIN':
                return redirect('manage')
            elif type == 'EMPLOYEE':
                return redirect('staff')
            else:
                message = 'Hãy dùng tài khoản của nhân viên!'
        else:
            message = 'Tài khoản hoặc mật khẩu chưa đúng!'

    context = { 'message' : message, 'title': "Đăng nhập"}
    return render(request, 'app/loginstaff.html', context)


# # chart statistic year
# @login_required(login_url='/loginstaff/')
# def manage(request):
#     bills = Bill.objects.all()
#     data = []
#     daynow = datetime.date.today()
#     numbooking = 0
#     bookingtoday = InfoBooking.objects.all()
#     for i in bookingtoday:
#         if i.date_booking.date() == daynow:
#             numbooking += 1
#     numstaff = len(Account.objects.filter(type='EMPLOYEE'))
#     numcustomer = len(Account.objects.filter(type='CUSTOMER'))
#     numproduct = len(Product.objects.all())
   
#     yearnow = datetime.datetime.now().year
#     total_price_daynow = 0
#     for i in range(1,13):
#         total_price = 0
#         for bill in bills:
#             if(bill.date_created.year == yearnow and bill.date_created.month == i):
#                 total_price += bill.total_price
#             if(bill.date_created.date() == daynow):
#                 total_price_daynow += bill.total_price
#         data.append(int(total_price))
#     total_price_year = sum(data)
#     text_total = 'Tổng doanh thu từ đầu năm '+ str(yearnow) + ' đến hiện tại: '+ '{:,}'.format(total_price_year) +'đ'

#     detailbills = DetailBill.objects.all()
#     listdetail = []
#     for i in range(len(detailbills)):
#         checkcategory = Product.objects.get(id=detailbills[i].product_id).category_id
#         if checkcategory != 1:
#             checkproduct = False
#             for tem in listdetail:
#                 if detailbills[i].product == tem[0]:
#                     checkproduct = True
#             if not checkproduct:
#                 val = detailbills[i].quantity
#                 for j in range(i+1, len(detailbills)):
#                     if detailbills[j].product_id == detailbills[i].product_id:
#                         val += detailbills[j].quantity
#                 listdetail.append((detailbills[i].product, val))
#     toplist = sorted(listdetail, key=itemgetter(1), reverse=True)[:5]

#     label_data = ["Tháng 1","Tháng 2","Tháng 3","Tháng 4","Tháng 5","Tháng 6","Tháng 7","Tháng 8","Tháng 9","Tháng 10","Tháng 11","Tháng 12"]
#     context = {'title': "Trang quản lý", 'numbooking': numbooking, 'numstaff': numstaff, 'numcustomer': numcustomer, 'numproduct': numproduct , 'label_data': label_data,'data': data, 'text_total': text_total, 'total_price_daynow': total_price_daynow,'toplist': toplist}
#     return render(request,'app/manageDashboard.html',context)

# chart statistic week
@login_required(login_url='/loginstaff/')
def manage(request):
    bills = Bill.objects.all()
    data = []
    label_data = []
    daynow = datetime.date.today()
    datestart = daynow - datetime.timedelta(days=7)
    for i in range(8):
        total_price = 0
        datecheck = datestart + datetime.timedelta(days=i)
        label_data.append(str(datecheck))
        for bill in bills:
            if(bill.date_created.date() == datecheck):
                total_price += bill.total_price
        data.append(int(total_price))
    numbooking = 0
    bookingtoday = InfoBooking.objects.all()
    for i in bookingtoday:
        if i.date_booking.date() == daynow:
            numbooking += 1
    numstaff = len(Account.objects.filter(type='EMPLOYEE'))
    numcustomer = len(Account.objects.filter(type='CUSTOMER'))
    numproduct = len(Product.objects.all())
   
    yearnow = datetime.datetime.now().year
    total_price_daynow = 0
    for bill in bills:
            if(bill.date_created.date() == daynow):
                total_price_daynow += bill.total_price

    total_price_week = sum(data)
    text_total = 'Tổng doanh thu từ đầu năm '+ str(yearnow) + ' đến hiện tại: '+ '{:,}'.format(total_price_week) +'đ'

    detailbills = DetailBill.objects.all()
    listdetail = []
    for i in range(len(detailbills)):
        checkcategory = Product.objects.get(id=detailbills[i].product_id).category_id
        if checkcategory != 1:
            checkproduct = False
            for tem in listdetail:
                if detailbills[i].product == tem[0]:
                    checkproduct = True
            if not checkproduct:
                val = detailbills[i].quantity
                for j in range(i+1, len(detailbills)):
                    if detailbills[j].product_id == detailbills[i].product_id:
                        val += detailbills[j].quantity
                listdetail.append((detailbills[i].product, val))
    toplist = sorted(listdetail, key=itemgetter(1), reverse=True)[:5]

    context = {'title': "Trang quản lý", 'numbooking': numbooking, 'numstaff': numstaff, 'numcustomer': numcustomer, 'numproduct': numproduct , 'label_data': label_data,'data': data, 'text_total': text_total, 'total_price_daynow': total_price_daynow,'toplist': toplist}
    return render(request,'app/manageDashboard.html',context)
    

@login_required(login_url='/loginstaff/')
def staff(request):
    if request.user.is_authenticated and request.method == "GET":
        tableid = request.GET.get('tableid', '')
        if(tableid == ''):
            tableid = 1
        tables = Table.objects.all()
        products = Product.objects.filter(active=True)
        categories = Category.objects.filter(active=True)

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

        # tables = Table.objects.all()
        # products = Product.objects.all()
        # categories = Category.objects.all()
        bill_total_word = num2words(bill.get_bill_total, lang='vi')
        context = {'title': "Nhân viên", 'table' : tablebill, 'tables' : tables, 'products' : products, 'categories' : categories, 'bill' : bill, 'detailbill': detailbill, 'bill_total_word': bill_total_word}
        return render(request, 'app/staff.html', context)

def logoutpage(request):
    logout(request)
    return redirect('login')

def logoutstaff(request):
    logout(request)
    return redirect('loginstaff')

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
            account = Account(user=user, name=name, phone='', email=email, address='', type='CUSTOMER')
            account.save()
            message = 'Đăng ký thành công. Mời bạn đang nhập!'
            context = {'message': message, 'user': user}
            return render(request, 'app/login.html', context)   
    
    context = {'form': form, 'order': order, 'title': "Đăng ký"}
    return render(request, 'app/register.html', context)

@login_required(login_url='/login/')
def infocustomer(request):
    categories = Category.objects.filter(active=True)
    user = request.user
    customer = Account.objects.get(user=user)
    order, created = Order.objects.get_or_create(account=customer,complete=False)
    form = AccountForm(instance=customer)
    form1 = CreateUserForm(instance=user)
    
    if request.method == 'POST':
        form2 = AccountForm(request.POST, instance=customer)

        user.first_name = form['name'].value()
        user.email = form2['email'].value()
        user.save()

        customer.name = form2['name'].value()
        customer.phone = form2['phone'].value()
        customer.email = form2['email'].value()
        customer.address = form2['address'].value()
        customer.save()
        
        message='Cập nhật thông tin thành công!'

        user = request.user
        customer = Account.objects.get(user=user)
       
        form = AccountForm(instance=customer)
        form1 = CreateUserForm(instance=user)

        context = {'categories' : categories, 'order' : order, 'form': form, "form1": form1, "message": message, 'title': "Thông tin khách hàng"} 
        return render(request, 'app/infoCustomer.html', context)
    
    context = {'categories' : categories, 'order' : order, 'form': form, "form1": form1, 'title': "Thông tin khách hàng"} 
    return render(request, 'app/infoCustomer.html', context)

@login_required(login_url='/loginstaff/')
def infostaff(request):

    message = ''
    user = request.user
    staff = Account.objects.get(user=user)
    form = AccountForm(instance=staff)
    form1 = CreateUserForm(instance=user)
    
    if request.method == 'POST':
        form = AccountForm(request.POST, instance=staff)
        form1 = CreateUserForm(request.POST, instance=user)

        user.first_name = form['name'].value()
        user.email = form['email'].value()
        user.save()

        staff.name = form['name'].value()
        staff.phone = form['phone'].value()
        staff.email = form['email'].value()
        staff.address = form['address'].value()
        staff.save()

        message='Cập nhật thông tin thành công!'
        return redirect('staff')
        
    
    context = {'form': form, "form1": form1, "message": message, 'title': "Thông tin nhân viên"} 
    return render(request, 'app/infoStaff.html', context)


def home(request):
    if request.user.is_authenticated:
        # user = request.user
        # account = Account.objects.get(user=user)
        account = request.user.account
        order, created = Order.objects.get_or_create(account=account,complete=False)
    else:
        order = {'get_cart_items' : 0}
    
    categories = Category.objects.filter(active=True)
    products = Product.objects.filter(active=True)

    detailbills = DetailBill.objects.all()
    listdetail = []
    for i in range(len(detailbills)):
        checkcategory = Product.objects.get(id=detailbills[i].product_id).category_id
        if checkcategory != 1:
            checkproduct = False
            for tem in listdetail:
                if detailbills[i].product_id == tem[0]:
                    checkproduct = True
            if not checkproduct:
                val = detailbills[i].quantity
                for j in range(i+1, len(detailbills)):
                    if detailbills[j].product_id == detailbills[i].product_id:
                        val += detailbills[j].quantity
                listdetail.append((detailbills[i].product_id, val))
    toplist = sorted(listdetail, key=itemgetter(1), reverse=True)[:3]
    topproducts = []
    for i in range(3):
       topproducts.append(Product.objects.get(id=toplist[i][0]))

    context = {'products' : products, 'categories' : categories, 'order' : order, 'topproducts': topproducts, 'title': "Trang chủ"} 
    return render(request, 'app/home.html', context)
                                                                                                                                                                                                                                                                                                                      
def search(request):
    categories = Category.objects.filter(active=True)
    order = {'get_cart_items' : 0}
    if request.method == 'POST':
        searchkey = request.POST['searchkey']
        keys = Product.objects.filter(name__icontains = searchkey)
    if request.user.is_authenticated:
        account = request.user.account
        order, created = Order.objects.get_or_create(account=account,complete=False)
    else:
        order = {'get_cart_items' : 0}
    context = {'categories': categories, 'order' : order, "searchkey": searchkey, "keys": keys, 'title': "Tìm kiếm"}
    return render(request, 'app/search.html', context)                                                                                                                                                                                                                                                                                                                                    

def categories(request):
    categories = Category.objects.filter(active=True)
    categoryid = request.GET.get('categoryid','')
    category = Category.objects.get(id=categoryid)
    products = Product.objects.filter(category=category, active=True)
    if request.user.is_authenticated:
        account = request.user.account
        order, created = Order.objects.get_or_create(account=account,complete=False)
        usercheck = True
    else:
        usercheck = False
        order = {'get_cart_items' : 0}
    context = {'categories': categories, 'category': category,'order' : order, 'usercheck': usercheck, "products": products, 'title': category.name}
    return render(request, 'app/categories.html', context)

def cart(request):
    categories = Category.objects.filter(active=True)
    if request.user.is_authenticated:
        account = request.user.account
        order, created = Order.objects.get_or_create(account=account, complete = False)
        items = order.orderitem_set.all()
    else:
        items = []
        order = {'get_cart_items' : 0, 'get_cart_total' : 0}
    context = { 'categories' : categories, 'items': items, 'order' : order, 'title': "Giỏ hàng" } 
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
    categories = Category.objects.filter(active=True)
    if request.user.is_authenticated:
        account = request.user.account
        form = AccountForm(instance=account)
        order, created = Order.objects.get_or_create(account=account, complete = False)
        items = order.orderitem_set.all()
        if request.method == "POST":
            form = AccountForm(request.POST, instance=account)
            numpeople = request.POST.get('numpeople')
            datebooking = request.POST.get('dateobooking')
            description = request.POST.get('description')
            name = form['name'].value()
            phone = form['phone'].value()
            email = form['email'].value()
            date_added = datetime.datetime.now()
            infobooking = InfoBooking(account=account,order=order,name=name,phone=phone,email=email,numpeople=numpeople,date_added=date_added,date_booking=datebooking,description=description)
            infobooking.save()
            
            order.complete = True
            order.save()

            return redirect('bookingtable')

    else:
        items = []
        order = {'get_cart_items' : 0, 'get_cart_total' : 0}
        form = AccountForm()
        
    context = { 'categories' : categories, 'items': items, 'order' : order, 'form' : form , 'title': "Đặt bàn"} 
    return render(request, 'app/checkout.html', context) 

# @login_required(login_url='/loginstaff/')
def bookingtable(request):
    categories = Category.objects.filter(active=True)
    if request.user.is_authenticated:
        account = request.user.account
        order, created = Order.objects.get_or_create(account=account, complete = False)
        
        infobooking = InfoBooking.objects.filter(account=account, status='WAIT')
        items = []
        for i in infobooking:
            items.append(OrderItem.objects.filter(order=i.order))           
       
    else:
        items=[]
        infobooking = {}
        order = {'get_cart_items' : 0, 'get_cart_total' : 0}

    context = { 'categories' : categories, 'order' : order, 'items' : items, 'infobooking' : infobooking, 'title': "Danh sách đặt bàn" } 
    return render(request, 'app/bookingtable.html', context) 

def detail(request):
    categories = Category.objects.filter(active=True)
    if request.user.is_authenticated:
        account = request.user.account
        order, created = Order.objects.get_or_create(account=account, complete = False)
        items = order.orderitem_set.all()
    else:
        items = []

        order = {'get_cart_items' : 0, 'get_cart_total' : 0}
    productid = request.GET.get('productid', '')
    product = Product.objects.get(id = productid)
    context = { 'categories' : categories, 'items': items, 'order' : order, 'product' : product, 'title': "Chi tiết món"} 
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
        bill.date_created = datetime.datetime.now()

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
    account = request.user.account
    
    table1 = Table.objects.get(id=id_table1)
    if action != 'checkout':
        table2 = Table.objects.get(id=id_table2)


    # checkbill = Bill.objects.filter(id_table=table1, status='unpaid')
    # if not checkbill.exists():
    #     bill = Bill.  


    bill1 = Bill.objects.get(id_table=table1, status = "unpaid")
    
    if action == 'merge':
        
        #change detailbill2 to detailbill1
        bill2, create = Bill.objects.get_or_create(id_table=table2, status = "unpaid")
        detailbill2 = DetailBill.objects.filter(bill=bill2)
        
        detailbill1 = DetailBill.objects.filter(bill=bill1)
        if detailbill1.exists():
            for detail in detailbill2:
                product = Product.objects.get(id=detail.product_id)
                checkdetail = DetailBill.objects.filter(bill=bill1, product=product)
                if checkdetail.exists():
                    checkdetail[0].quantity += detail.quantity
                    checkdetail[0].save()
                else:
                    detail.bill=bill1
                    detail.save()
        else: 
            detailbill2.update(bill=bill1)

        if table2.status == "empty":
            table2.status = "busy"
            table2.save()

        bill2.status = "paid"
        bill2.total_price = 0
        bill2.save()

        if table1.status == "empty":
            table1.status = "busy"
            table1.save()

        # add table2 in bill1
        for table in bill2.id_table.all():
            bill1.id_table.add(table)
        
        bill1.total_price = bill1.get_bill_total
        bill1.save()
        # bill1.id_table.remove(table2)

        print('Gộp bàn '+id_table1+' và bàn '+id_table2) 

    elif action == 'change':
        # table2 is empty
        bill2 = Bill.objects.get(id_table=table2, status = "unpaid")

        if bill1.id_table.all().count() == 1:
           
            detailbill1 = DetailBill.objects.filter(bill=bill1)
            detailbill1.update(bill=bill2)
            bill1.status = 'paid'
        
        else:
            bill1.id_table.remove(table1)
            bill1.id_table.add(table2)
            bill2.status = 'paid'

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
        bill.account = account
        bill.status = "paid"
        bill.date_checkout = datetime.datetime.now()
        bill.id_table.all().update(status="empty")
        bill.save()
        print('Thanh toán bàn '+id_table1+' thành công!') 


    return JsonResponse('updated', safe=False)         

@login_required(login_url='/loginstaff/')
def bill(request, pk):
    bill = Bill.objects.get(id=pk)
    detailbill = DetailBill.objects.filter(bill=bill)
    bill_total_word = num2words(bill.get_bill_total, lang='vi').capitalize()
    context = {'bill' : bill, 'detailbill': detailbill, 'bill_total_word': bill_total_word, 'title': "Hóa đơn"}
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


@login_required(login_url='/loginstaff/')
def manageproduct(request):
    message = ''
    if request.user.is_authenticated and request.method == "GET":
        n = 0
        categories = Category.objects.all()
        products = Product.objects.all()
        context = {'n': n, 'categories': categories, 'products': products, 'title': "Quản lý món"}
        return render(request,'app/manageproduct.html',context)
    
    usercheck = False
    context = {'usercheck' : usercheck, 'message' : message, 'title': "Đăng nhập"}
    return render(request, 'app/loginstaff.html', context)

@login_required(login_url='/loginstaff/')
def addproduct(request):
    form = ProductForm()
    if request.method == 'POST':
        form = ProductForm(request.POST, request.FILES)
        if form.is_valid():
            form.save()
            return redirect('manageproduct')
    context = {"form": form, 'title': "Thêm món"}
    return render(request, 'app/addproduct.html', context)

@login_required(login_url='/loginstaff/')
def updateproduct(request, pk):
    product = Product.objects.get(id=pk)
    
    form = ProductForm(instance=product)
    if request.method == 'POST':
        form = ProductForm(request.POST, request.FILES, instance=product)
        if form.is_valid():
            form.save()
            return redirect('manageproduct')
        
    context = {"form": form, 'title': "Cập nhật món"}
    return render(request, 'app/updateproduct.html', context)

@login_required(login_url='/loginstaff/')
def deleteproduct(request, pk):
    product = Product.objects.get(id=pk)
    product.delete()
    return redirect('manageproduct')

    
@login_required(login_url='/loginstaff/')
def managecategory(request):
    message = ''
    if request.user.is_authenticated and request.method == "GET":
        n = 0
        categories = Category.objects.all()
        products = Product.objects.all()
        context = {'n': n, 'categories': categories, 'products': products, 'title': "Quản lý thực đơn"}
        return render(request,'app/managecategory.html',context)

@login_required(login_url='/loginstaff/')
def addcategory(request):
    form = CategoryForm()
    if request.method == 'POST':
        form = CategoryForm(request.POST)
        if form.is_valid():
            form.save()
            return redirect('manage')
    context = {"form": form, 'title': "Thêm thực đơn"}
    return render(request, 'app/addcategory.html', context)

@login_required(login_url='/loginstaff/')
def updatecategory(request, pk):
    category = Category.objects.get(id=pk)
    
    form = CategoryForm(instance=category)

    if request.method == 'POST':
        form = CategoryForm(request.POST, instance=category)
        if form.is_valid():
            form.save()
            return redirect('manage')
        
    context = {"form": form, 'title': "Cập nhật thực đơn"}
    return render(request, 'app/updatecategory.html', context)

@login_required(login_url='/loginstaff/')
def deletecategory(request, pk):
    category = Category.objects.get(id=pk)
    category.delete()
    return redirect('manage')


@login_required(login_url='/loginstaff/')
def managetable(request):
    message = ''
    if request.user.is_authenticated and request.method == "GET":
        tables = Table.objects.all()
        context = {'tables': tables, 'title': "Quản lý bàn"}
        return render(request,'app/managetable.html',context)
            
    usercheck = False
    context = {'usercheck' : usercheck, 'message' : message, 'title': "Đăng nhập"}
    return render(request, 'app/loginstaff.html', context)

@login_required(login_url='/loginstaff/')
def addtable(request):
    form = TableForm()
    if request.method == 'POST':
        form = TableForm(request.POST)
        if form.is_valid():
            form.save()
            return redirect('managetable')
    context = {"form": form, 'title': "Thêm bàn"}
    return render(request, 'app/addtable.html', context)

@login_required(login_url='/loginstaff/')
def updatetable(request, pk):
    table = Table.objects.get(id=pk)
    
    form = TableForm(instance=table)

    if request.method == 'POST':
        form = TableForm(request.POST, instance=table)
        if form.is_valid():
            form.save()
            return redirect('managetable')
        
    context = {"form": form, 'title': "Cập nhật bàn"}
    return render(request, 'app/updatetable.html', context)

@login_required(login_url='/loginstaff/')
def deletetable(request, pk):
    table = Table.objects.get(id=pk)
    table.delete()
    return redirect('managetable')

@login_required(login_url='/loginstaff/')
def managebooking(request):
    
    infobooking = InfoBooking.objects.all()
    items = []
    for i in infobooking:
        items.append(OrderItem.objects.filter(order=i.order))    
 
    context = {'items' : items, 'infobooking' : infobooking, 'title': "Quản lý đặt bàn"} 
    return render(request, 'app/managebooking.html', context) 

@login_required(login_url='/loginstaff/')
def updatebooking(request, pk):
    booking = InfoBooking.objects.get(id=pk)
    form = InfoBookingForm(instance=booking)

    if request.method == 'POST':
        form = InfoBookingForm(request.POST, instance=booking)
        status = form['status'].value()
        if status != booking.status:
            booking.status = status
            booking.save()
        return redirect('managebooking')
        
    context = {"form": form, 'title': "Cập nhật đặt bàn"}
    return render(request, 'app/updatebooking.html', context)

@login_required(login_url='/loginstaff/')
def deletebooking(request, pk):
    booking = InfoBooking.objects.get(id=pk)
    booking.delete()
    return redirect('managebooking')

@login_required(login_url='/loginstaff/')
def managestaff(request):
    message = ''
    if request.user.is_authenticated and request.method == "GET":
        staffs = Account.objects.filter(type='EMPLOYEE')
        
        context = {'staffs': staffs, 'title': "Quản lý nhân viên"}
        return render(request,'app/managestaff.html',context)
            
    usercheck = False
    context = {'usercheck' : usercheck, 'message' : message, 'title': "Đăng nhập"}
    return render(request, 'app/loginstaff.html', context)

@login_required(login_url='/loginstaff/')
def addstaff(request):
    form = CreateUserForm()
    form1 = AccountForm()
    if request.method == 'POST':
        form = CreateUserForm(request.POST)
        form1 = AccountForm(request.POST)
        if form.is_valid():
            form.save()
            username = form.cleaned_data['username']
            name = form.cleaned_data['first_name']
            email = form.cleaned_data['email']  
            phone = form1['phone'].value()
            address = form1['address'].value()
            type = "EMPLOYEE"  
            user = User.objects.get(username=username)
            account = Account(user=user, name=name, phone=phone, email=email, address=address, type=type)
            account.save()
            return redirect('managestaff')
    context = {"form": form, "form1": form1, 'title': "Thêm nhân viên"}
    return render(request, 'app/addstaff.html', context)

@login_required(login_url='/loginstaff/')
def updatestaff(request, pk):
    staff = Account.objects.get(id=pk)
    user = User.objects.get(id=staff.user.id)
    form = AccountForm(instance=staff)
    form1 = CreateUserForm(instance=user)
    if request.method == 'POST':
        form = AccountForm(request.POST, instance=staff)
        form1 = CreateUserForm(request.POST, instance=user)
    
        user.first_name = form['name'].value()
        user.email = form['email'].value()
        user.save()

        staff.name = form['name'].value()
        staff.phone = form['phone'].value()
        staff.email = form['email'].value()
        staff.address = form['address'].value()
        staff.type = form['type'].value()
        staff.save()

        return redirect('managestaff')
        
    context = {"form": form, "form1": form1, 'title': "Cập nhật nhân viên"}
    return render(request, 'app/updatestaff.html', context)

@login_required(login_url='/loginstaff/')
def deletestaff(request, pk):
    staff = Account.objects.get(id=pk)
    staff.delete()
    return redirect('managestaff')


@login_required(login_url='/loginstaff/')
def managecustomer(request):
    message = ''
    if request.user.is_authenticated and request.method == "GET":
        customers= Account.objects.filter(type='CUSTOMER')
        
        context = {'customers': customers, 'title': "Quản lý khách hàng"}
        return render(request,'app/managecustomer.html',context)
            
    usercheck = False
    context = {'usercheck' : usercheck, 'message' : message, 'title': "Đăng nhập"}
    return render(request, 'app/logincustomer.html', context)

@login_required(login_url='/loginstaff/')
def addcustomer(request):
    form = CreateUserForm()
    form1 = AccountForm()
    if request.method == 'POST':
        form = CreateUserForm(request.POST)
        form1 = AccountForm(request.POST)
        if form.is_valid():
            form.save()
            username = form.cleaned_data['username']
            name = form.cleaned_data['first_name']
            email = form.cleaned_data['email']  
            phone = form1['phone'].value()
            address = form1['address'].value()
            type = "CUSTOMER"  
            user = User.objects.get(username=username)
            account = Account(user=user, name=name, phone=phone, email=email, address=address, type=type)
            account.save()
            return redirect('managecustomer')
    context = {"form": form, "form1": form1, 'title': "Thêm khách hàng"}
    return render(request, 'app/addcustomer.html', context)

@login_required(login_url='/loginstaff/')
def updatecustomer(request, pk):
    customer = Account.objects.get(id=pk)
    user = User.objects.get(id=customer.user.id)
    form = AccountForm(instance=customer)
    form1 = CreateUserForm(instance=user)
    if request.method == 'POST':
        form = AccountForm(request.POST, instance=customer)
        form1 = CreateUserForm(request.POST, instance=user)

        user.first_name = form['name'].value()
        user.email = form['email'].value()
        user.save()

        customer.name = form['name'].value()
        customer.phone = form['phone'].value()
        customer.email = form['email'].value()
        customer.address = form['address'].value()
        customer.save()

        return redirect('managecustomer')
        
    context = {"form": form, "form1": form1, 'title': "Cập nhật khách hàng"}
    return render(request, 'app/updatecustomer.html', context)

@login_required(login_url='/loginstaff/')
def deletecustomer(request, pk):
    customer = Account.objects.get(id=pk)
    customer.delete()
    return redirect('managecustomer')

@login_required(login_url='/loginstaff/')
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
    context = {'title': "Thống kê theo ngày", 'check': 'day', 'label_data': label_data,'data': data, 'data1': data1, 'text_total': text_total, 'text_max': text_max, 'text_min': text_min}
    return render(request, 'app/managetatistics.html', context)

@login_required(login_url='/loginstaff/')
def statistics_date(request):
    bills = Bill.objects.all()
    data = []
    data1 = []
    label_data = []
    
    daystart = datetime.datetime.strptime(request.POST.get('daystart'), '%Y-%m-%d').date()
    dayend = datetime.datetime.strptime(request.POST.get('dayend'), '%Y-%m-%d').date()
    for i in bills:
        datecheck = i.date_created.date()
        if datecheck >= daystart and datecheck <= dayend:
            if str(datecheck) not in label_data:
                label_data.append(str(datecheck))
                
    label_data = sorted(label_data)
    for day in label_data:
        total_price = 0
        for bill in bills:
            if(str(bill.date_created.date()) == day):
                total_price += bill.total_price
        data.append(int(total_price))

    total_price_week = sum(data)
    text_total = 'Tổng doanh thu từ ngày '+ str(daystart) + ' đến ngày '+ str(dayend) +': '+ '{:,}'.format(total_price_week) +'đ'
    for i in range(len(data)):
        data1.append(round((data[i]/total_price_week)*100, 1))
    
    total_price_max = max(data)
    day_max = daystart + datetime.timedelta(days=data.index(total_price_max))
    text_max = 'Doanh thu ngày cao nhất ' + str(day_max) + ' : ' + '{:,}'.format(total_price_max) +'đ'
    total_price_min = min(data)
    day_min = daystart + datetime.timedelta(days=data.index(total_price_min))
    text_min = 'Doanh thu ngày thấp nhất ' + str(day_min) + ' : ' + '{:,}'.format(total_price_min) +'đ'
    context = {'title': "Thống kê theo ngày", 'check': 'day', 'label_data': label_data,'data': data, 'data1': data1, 'text_total': text_total, 'text_max': text_max, 'text_min': text_min}
    return render(request, 'app/managetatistics.html', context)

@login_required(login_url='/loginstaff/')
def monthstatistics(request):
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
    if total_price_year != 0:
        for i in range(len(data)):
            data1.append(round((data[i]/total_price_year)*100, 1))
    year = []
    for i in bills:
        yearbill = i.date_created.year
        if yearbill not in year:
            year.append(yearbill)
    yearmax = max(year)
    yearmin = min(year)
    
    label_data = ["Tháng 1","Tháng 2","Tháng 3","Tháng 4","Tháng 5","Tháng 6","Tháng 7","Tháng 8","Tháng 9","Tháng 10","Tháng 11","Tháng 12"]
    total_price_max = max(data)
    text_max = 'Doanh thu tháng cao nhất ' + label_data[data.index(total_price_max)] + ' : ' + '{:,}'.format(total_price_max) +'đ'
    total_price_min = min(data)
    text_min = 'Doanh thu tháng thấp nhất ' + label_data[data.index(total_price_min)] + ' : ' + '{:,}'.format(total_price_min) +'đ'
    context = {'title': "Thống kê theo tháng", 'yearmax': yearmax, 'yearmin': yearmin, 'yearnow': yearnow, 'label_data': label_data,'data': data, 'data1': data1, 'text_total': text_total, 'text_max': text_max, 'text_min': text_min}
    return render(request, 'app/managetatistics.html', context)

@login_required(login_url='/loginstaff/')
def statistics_year(request):
    # print(datetime.date.today() + datetime.timedelta(days=1))
    bills = Bill.objects.all()
    data = []
    data1 = []
    yearnow = request.POST.get('year')
    for i in range(1,13):
        total_price = 0
        for bill in bills:
            if(bill.date_created.year == int(yearnow) and bill.date_created.month == i):
                total_price += bill.total_price
        data.append(int(total_price))
    total_price_year = sum(data)
    text_total = 'Tổng doanh thu năm '+ str(yearnow) + ': '+ '{:,}'.format(total_price_year) +'đ'
    if total_price_year != 0:
        for i in range(len(data)):
            data1.append(round((data[i]/total_price_year)*100, 1))
    year = []
    for i in bills:
        yearbill = i.date_created.year
        if yearbill not in year:
            year.append(yearbill)
    yearmax = max(year)
    yearmin = min(year)
    
    label_data = ["Tháng 1","Tháng 2","Tháng 3","Tháng 4","Tháng 5","Tháng 6","Tháng 7","Tháng 8","Tháng 9","Tháng 10","Tháng 11","Tháng 12"]
    total_price_max = max(data)
    text_max = 'Doanh thu ngày cao nhất ' + label_data[data.index(total_price_max)] + ' : ' + '{:,}'.format(total_price_max) +'đ'
    total_price_min = min(data)
    text_min = 'Doanh thu tháng thấp nhất ' + label_data[data.index(total_price_min)] + ' : ' + '{:,}'.format(total_price_min) +'đ'
    context = {'title': "Thống kê theo tháng", 'yearmax': yearmax, 'yearmin': yearmin, 'yearnow': yearnow, 'label_data': label_data,'data': data, 'data1': data1, 'text_total': text_total, 'text_max': text_max, 'text_min': text_min}
    return render(request, 'app/managetatistics.html', context)

def index(request):
    return render(request, "payment/index.html", {"title": "Danh sách demo"})


def hmacsha512(key, data):
    byteKey = key.encode('utf-8')
    byteData = data.encode('utf-8')
    return hmac.new(byteKey, byteData, hashlib.sha512).hexdigest()


def payment(request):
    if request.user.is_authenticated:
        account = request.user.account
        order = Order.objects.get(account=account, complete = False)
        if request.method == "POST":

            form = AccountForm(request.POST, instance=account)
            numpeople = request.POST.get('numpeople')
            datebooking = request.POST.get('dateobooking')
            description = request.POST.get('description')
            name = form['name'].value()
            phone = form['phone'].value()
            email = form['email'].value()
            date_added = datetime.datetime.now()

            infobooking = InfoBooking(account=account,order=order,name=name,phone=phone,email=email,numpeople=numpeople,date_added=date_added,date_booking=datebooking,description=description,paytype="PAYONLINE")
            infobooking.save()
            
            order.complete = True
            order.save()

            order_type = "billpayment"
            booking_id = datetime.datetime.now().strftime("%Y%m%d%H%M%S")+"-" + str(infobooking.id)
            amount = math.trunc(order.get_cart_total)
            order_desc = "Thanh toan dat ban ngay " + datetime.datetime.now().strftime("%Y-%m-%d %H:%M:%S")
            bank_code = ""
            language = "vn"
            ipaddr = get_client_ip(request)
            # Build URL Payment

            vnp = vnpay()
            vnp.requestData['vnp_Version'] = '2.1.0'
            vnp.requestData['vnp_Command'] = 'pay'
            vnp.requestData['vnp_TmnCode'] = settings.VNPAY_TMN_CODE
            vnp.requestData['vnp_Amount'] = amount * 100
            vnp.requestData['vnp_CurrCode'] = 'VND'
            vnp.requestData['vnp_TxnRef'] = booking_id
            vnp.requestData['vnp_OrderInfo'] = order_desc
            vnp.requestData['vnp_OrderType'] = order_type
            # Check language, default: vn
            if language and language != '':
                vnp.requestData['vnp_Locale'] = language
            else:
                vnp.requestData['vnp_Locale'] = 'vn'
                # Check bank_code, if bank_code is empty, customer will be selected bank on VNPAY
            if bank_code and bank_code != "":
                vnp.requestData['vnp_BankCode'] = bank_code

            vnp.requestData['vnp_CreateDate'] = datetime.datetime.now().strftime('%Y%m%d%H%M%S')  # 20150410063022
            vnp.requestData['vnp_IpAddr'] = ipaddr
            vnp.requestData['vnp_ReturnUrl'] = settings.VNPAY_RETURN_URL
            vnpay_payment_url = vnp.get_payment_url(settings.VNPAY_PAYMENT_URL, settings.VNPAY_HASH_SECRET_KEY)
            print(vnpay_payment_url)
            return redirect(vnpay_payment_url)


def payment_ipn(request):
    inputData = request.GET
    if inputData:
        vnp = vnpay()
        vnp.responseData = inputData.dict()
        order_id = inputData['vnp_TxnRef']
        amount = inputData['vnp_Amount']
        order_desc = inputData['vnp_OrderInfo']
        vnp_TransactionNo = inputData['vnp_TransactionNo']
        vnp_ResponseCode = inputData['vnp_ResponseCode']
        vnp_TmnCode = inputData['vnp_TmnCode']
        vnp_PayDate = inputData['vnp_PayDate']
        vnp_BankCode = inputData['vnp_BankCode']
        vnp_CardType = inputData['vnp_CardType']
        if vnp.validate_response(settings.VNPAY_HASH_SECRET_KEY):
            # Check & Update Order Status in your Database
            # Your code here
            firstTimeUpdate = True
            totalamount = True
            if totalamount:
                if firstTimeUpdate:
                    if vnp_ResponseCode == '00':
                        print('Payment Success. Your code implement here')
                    else:
                        print('Payment Error. Your code implement here')

                    # Return VNPAY: Merchant update success
                    result = JsonResponse({'RspCode': '00', 'Message': 'Confirm Success'})
                else:
                    # Already Update
                    result = JsonResponse({'RspCode': '02', 'Message': 'Order Already Update'})
            else:
                # invalid amount
                result = JsonResponse({'RspCode': '04', 'Message': 'invalid amount'})
        else:
            # Invalid Signature
            result = JsonResponse({'RspCode': '97', 'Message': 'Invalid Signature'})
    else:
        result = JsonResponse({'RspCode': '99', 'Message': 'Invalid request'})

    return result


def payment_return(request):
    inputData = request.GET
    if inputData:
        vnp = vnpay()
        vnp.responseData = inputData.dict()
        booking_id = inputData['vnp_TxnRef'][15:]
        amount = int(inputData['vnp_Amount']) / 100
        order_desc = inputData['vnp_OrderInfo']
        vnp_TransactionNo = inputData['vnp_TransactionNo']
        vnp_ResponseCode = inputData['vnp_ResponseCode']

        categories = Category.objects.filter(active=True)
        if vnp.validate_response(settings.VNPAY_HASH_SECRET_KEY):
            if vnp_ResponseCode == "00":
                order = {'get_cart_items' : 0, 'get_cart_total' : 0}
                return render(request, "payment/payment_return.html", {"title": "Kết quả thanh toán",
                                                                    "categories": categories, "order": order, 
                                                                    "result": "Thành công", "booking_id": booking_id,
                                                                    "amount": amount,
                                                                    "order_desc": order_desc,
                                                                    "vnp_TransactionNo": vnp_TransactionNo,
                                                                    "vnp_ResponseCode": vnp_ResponseCode})
            else:
                infoBooking = InfoBooking.objects.get(id=booking_id)
                order = infoBooking.order
                order.complete = False
                order.save()

                infoBooking.delete()

                return render(request, "payment/payment_return.html", {"title": "Kết quả thanh toán",
                                                                    "categories": categories, "order": order,        
                                                                    "result": "Lỗi", "booking_id": booking_id,
                                                                    "amount": amount,
                                                                    "order_desc": order_desc,
                                                                    "vnp_TransactionNo": vnp_TransactionNo,
                                                                    "vnp_ResponseCode": vnp_ResponseCode})
        else:
            infoBooking = InfoBooking.objects.get(id=booking_id)
            order = infoBooking.order
            order.complete = False
            order.save()

            infoBooking.delete()
            return render(request, "payment/payment_return.html",
                          {"title": "Kết quả thanh toán",
                           "categories": categories, "order": order,  
                           "result": "Lỗi", "booking_id": booking_id, 
                           "amount": amount, "order_desc": order_desc, 
                           "vnp_TransactionNo": vnp_TransactionNo,
                           "vnp_ResponseCode": vnp_ResponseCode, 
                           "msg": "Sai checksum"})
    else:
        infoBooking = InfoBooking.objects.get(id=booking_id)
        order = infoBooking.order
        order.complete = False
        order.save()

        infoBooking.delete()

        return render(request, "payment_return.html", {"title": "Kết quả thanh toán", "categories": categories, "order": order,  "result": ""})


def get_client_ip(request):
    x_forwarded_for = request.META.get('HTTP_X_FORWARDED_FOR')
    if x_forwarded_for:
        ip = x_forwarded_for.split(',')[0]
    else:
        ip = request.META.get('REMOTE_ADDR')
    return ip

n = random.randint(10**11, 10**12 - 1)
n_str = str(n)
while len(n_str) < 12:
    n_str = '0' + n_str


def query(request):
    if request.method == 'GET':
        return render(request, "payment/query.html", {"title": "Kiểm tra kết quả giao dịch"})

    url = settings.VNPAY_API_URL
    secret_key = settings.VNPAY_HASH_SECRET_KEY
    vnp_TmnCode = settings.VNPAY_TMN_CODE
    vnp_Version = '2.1.0'

    vnp_RequestId = n_str
    vnp_Command = 'querydr'
    vnp_TxnRef = request.POST['order_id']
    vnp_OrderInfo = 'kiem tra gd'
    vnp_TransactionDate = request.POST['trans_date']
    vnp_CreateDate = datetime.datetime.now().strftime('%Y%m%d%H%M%S')
    vnp_IpAddr = get_client_ip(request)

    hash_data = "|".join([
        vnp_RequestId, vnp_Version, vnp_Command, vnp_TmnCode,
        vnp_TxnRef, vnp_TransactionDate, vnp_CreateDate,
        vnp_IpAddr, vnp_OrderInfo
    ])

    secure_hash = hmac.new(secret_key.encode(), hash_data.encode(), hashlib.sha512).hexdigest()

    data = {
        "vnp_RequestId": vnp_RequestId,
        "vnp_TmnCode": vnp_TmnCode,
        "vnp_Command": vnp_Command,
        "vnp_TxnRef": vnp_TxnRef,
        "vnp_OrderInfo": vnp_OrderInfo,
        "vnp_TransactionDate": vnp_TransactionDate,
        "vnp_CreateDate": vnp_CreateDate,
        "vnp_IpAddr": vnp_IpAddr,
        "vnp_Version": vnp_Version,
        "vnp_SecureHash": secure_hash
    }

    headers = {"Content-Type": "application/json"}

    response = requests.post(url, headers=headers, data=json.dumps(data))

    if response.status_code == 200:
        response_json = json.loads(response.text)
    else:
        response_json = {"error": f"Request failed with status code: {response.status_code}"}

    return render(request, "payment/query.html", {"title": "Kiểm tra kết quả giao dịch", "response_json": response_json})

def refund(request):
    if request.method == 'GET':
        return render(request, "payment/refund.html", {"title": "Hoàn tiền giao dịch"})

    url = settings.VNPAY_API_URL
    secret_key = settings.VNPAY_HASH_SECRET_KEY
    vnp_TmnCode = settings.VNPAY_TMN_CODE
    vnp_RequestId = n_str
    vnp_Version = '2.1.0'
    vnp_Command = 'refund'
    vnp_TransactionType = request.POST['TransactionType']
    vnp_TxnRef = request.POST['order_id']
    vnp_Amount = request.POST['amount']
    vnp_OrderInfo = request.POST['order_desc']
    vnp_TransactionNo = '0'
    vnp_TransactionDate = request.POST['trans_date']
    vnp_CreateDate = datetime.datetime.now().strftime('%Y%m%d%H%M%S')
    vnp_CreateBy = 'user01'
    vnp_IpAddr = get_client_ip(request)

    hash_data = "|".join([
        vnp_RequestId, vnp_Version, vnp_Command, vnp_TmnCode, vnp_TransactionType, vnp_TxnRef,
        vnp_Amount, vnp_TransactionNo, vnp_TransactionDate, vnp_CreateBy, vnp_CreateDate,
        vnp_IpAddr, vnp_OrderInfo
    ])

    secure_hash = hmac.new(secret_key.encode(), hash_data.encode(), hashlib.sha512).hexdigest()

    data = {
        "vnp_RequestId": vnp_RequestId,
        "vnp_TmnCode": vnp_TmnCode,
        "vnp_Command": vnp_Command,
        "vnp_TxnRef": vnp_TxnRef,
        "vnp_Amount": vnp_Amount,
        "vnp_OrderInfo": vnp_OrderInfo,
        "vnp_TransactionDate": vnp_TransactionDate,
        "vnp_CreateDate": vnp_CreateDate,
        "vnp_IpAddr": vnp_IpAddr,
        "vnp_TransactionType": vnp_TransactionType,
        "vnp_TransactionNo": vnp_TransactionNo,
        "vnp_CreateBy": vnp_CreateBy,
        "vnp_Version": vnp_Version,
        "vnp_SecureHash": secure_hash
    }

    headers = {"Content-Type": "application/json"}

    response = requests.post(url, headers=headers, data=json.dumps(data))

    if response.status_code == 200:
        response_json = json.loads(response.text)
    else:
        response_json = {"error": f"Request failed with status code: {response.status_code}"}

    return render(request, "payment/refund.html", {"title": "Kết quả hoàn tiền giao dịch", "response_json": response_json})