from django.contrib import admin
from django.urls import path
from . import views

urlpatterns = [
    path('', views.home , name="home"),
    path('login/', views.loginpage, name="login"),
    path('search/', views.search, name="search"),
    path('categories/', views.categories, name="categories"),
    path('logout/', views.logoutpage, name="logout"),
    path('register/', views.register, name="register"),
    path('cart/', views.cart, name="cart"),
    path('update_item/', views.updateitem, name="update_item"),
    path('checkout/', views.checkout, name="checkout"),
    path('detail/', views.detail, name="detail"),
]
