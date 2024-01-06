from django.contrib import admin
from django.urls import path
from . import views

urlpatterns = [
    path('', views.home , name="home"),
    path('login/', views.loginpage, name="login"),
    path('loginstaff/', views.loginstaff, name="loginstaff"),
    path('search/', views.search, name="search"),
    path('categories/', views.categories, name="categories"),
    path('logout/', views.logoutpage, name="logout"),
    path('logoutstaff/', views.logoutstaff, name="logoutstaff"),
    path('register/', views.register, name="register"),
    path('infocustomer/', views.infocustomer, name="infocustomer"),
    path('infostaff/', views.infostaff, name="infostaff"),
    path('cart/', views.cart, name="cart"),
    path('update_item/', views.updateitem, name="update_item"),
    path('checkout/', views.checkout, name="checkout"),
    path('bookingtable/', views.bookingtable, name="bookingtable"),
    path('detail/', views.detail, name="detail"),
    
    path('staff/', views.staff, name="staff"),
    # path('choose_table/', views.choosetable, name="choose_table"),
    path('update_bill/', views.updatebill, name="update_bill"),
    path('update_table_bill/', views.updatetablebill, name="updatetablebill"),
    # path('checkout_table/', views.checkouttable, name="checkout_table"),
    
    # path('managecategory/', views.managecategory, name="managecategory"),
    path('manage/', views.manage, name="manage"),   
    path('addcategory/', views.addcategory, name="addcategory"),
    path('updatecategory/<int:pk>/', views.updatecategory, name="updatecategory"),
    path('deletecategory/<int:pk>/', views.deletecategory, name="deletecategory"),

    path('manageproduct/', views.manageproduct, name="manageproduct"),
    path('addproduct/', views.addproduct, name="addproduct"),
    path('updateproduct/<int:pk>/', views.updateproduct, name="updateproduct"),
    path('deleteproduct/<int:pk>/', views.deleteproduct, name="deleteproduct"),
    
    path('managetable/', views.managetable, name="managetable"),
    path('addtable/', views.addtable, name="addtable"),
    path('updatetable/<int:pk>/', views.updatetable, name="updatetable"),
    path('deletetable/<int:pk>/', views.deletetable, name="deletetable"),

    path('managebooking/', views.managebooking, name="managebooking"),
    path('updatebooking/<int:pk>/', views.updatebooking, name="updatebooking"),
    path('deletebooking/<int:pk>/', views.deletebooking, name="deletebooking"),

    path('managestaff/', views.managestaff, name="managestaff"),
    path('addstaff/', views.addstaff, name="addstaff"),
    path('updatestaff/<int:pk>/', views.updatestaff, name="updatestaff"),
    path('deletestaff/<int:pk>/', views.deletestaff, name="deletestaff"),

    path('managecustomer/', views.managecustomer, name="managecustomer"),
    path('addcustomer/', views.addcustomer, name="addcustomer"),
    path('updatecustomer/<int:pk>/', views.updatecustomer, name="updatecustomer"),
    path('deletecustomer/<int:pk>/', views.deletecustomer, name="deletecustomer"),

    path('monthstatistics/', views.monthstatistics, name="monthstatistics"),
    path('daystatistics/', views.daystatistics, name="daystatistics"),
    
    path('statistics_date/', views.statistics_date, name="statistics_date"),
    path('statistics_year/', views.statistics_year, name="statistics_year"),

    path('bill/<int:pk>/', views.bill, name="bill"),

    path('pay', views.index, name='index'),
    path('payment', views.payment, name='payment'),
    path('payment_ipn', views.payment_ipn, name='payment_ipn'),
    path('payment_return', views.payment_return, name='payment_return'),
    path('query', views.query, name='query'),
    path('refund', views.refund, name='refund'),

]
