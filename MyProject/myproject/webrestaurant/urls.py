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
    path('register/', views.register, name="register"),
    # path('registerstaff/', views.registerstaff, name="registerstaff"),
    path('cart/', views.cart, name="cart"),
    path('update_item/', views.updateitem, name="update_item"),
    path('checkout/', views.checkout, name="checkout"),
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

    # path('managestaff/', views.managestaff, name="managestaff"),
    # path('addstaff/', views.addstaff, name="addstaff"),
    # path('updatepstaff/<int:pk>/', views.updatepstaff, name="updatepstaff"),
    # path('deletestaff/<int:pk>/', views.deletestaff, name="deletestaff"),

    # path('managecustomer/', views.managecustomer, name="managecustomer"),
    # path('addcustomer/', views.addcustomer, name="addstaff"),
    # path('updatepcustomer/<int:pk>/', views.updatepcustomer, name="updatepcustomer"),
    # path('deletecustomer/<int:pk>/', views.deletecustomer, name="deletecustomer"),

    path('monthstatistics/', views.monthstatistics, name="monthstatistics"),
    path('daystatistics/', views.daystatistics, name="daystatistics"),
    path('bill/<int:pk>/', views.bill, name="bill"),
]
