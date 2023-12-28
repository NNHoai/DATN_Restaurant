from django import forms
from . models import Account, Category, InfoBooking, Product, Table, User

from django.contrib.auth.forms import UserCreationForm

class CreateUserForm(UserCreationForm):
    class Meta:
        model = User
        fields = ['username', 'first_name', 'last_name', 'email', 'password1', 'password2']
        widgets = {
            'username': forms.TextInput(attrs={'class': 'form-control'}),
            'first_name': forms.TextInput(attrs={'class': 'form-control'}),
            'email': forms.EmailInput(attrs={'class': 'form-control'}),
            'password1': forms.PasswordInput(attrs={'class': "form-control"}),
            'password2': forms.PasswordInput(attrs={'class': 'form-control'})
        }

class ProductForm(forms.ModelForm):
    class Meta:
        model = Product
        fields = ['name', 'price', 'description', 'image', 'active', 'category']
        widgets = {
            'name': forms.TextInput(attrs={'class': 'form-control'}),
            'price': forms.TextInput(attrs={'class': 'form-control'}),
            'description': forms.Textarea(attrs={'class': 'form-control', 'rows':5, 'cols':70}),
            'image': forms.FileInput(attrs={'class': 'form-control'}),  
            'category': forms.Select(attrs={'class': 'form-control'}),
        }

class CategoryForm(forms.ModelForm):
    class Meta:
        model = Category
        fields = ['name', 'active']
        widgets = {
            'name': forms.TextInput(attrs={'class': 'form-control'}),
        }

class InfoBookingForm(forms.ModelForm):
    class Meta:
        model = InfoBooking
        fields = ['account', 'order', 'name', 'phone', 'email', 'numpeople', 'date_booking', 'description', 'status']
        widgets = {
            'name': forms.TextInput(attrs={'class': 'form-control'}),
            'phone': forms.TextInput(attrs={'class': 'form-control'}),
            'date_booking': forms.DateTimeInput(attrs={'class': 'form-control'}),
            'status': forms.Select(attrs={'class': 'form-control', 'style': 'width:50%'}),

        }

class TableForm(forms.ModelForm):
    class Meta:
        model = Table
        fields = ['name', 'status']
        widgets = {
            'name': forms.TextInput(attrs={'class': 'form-control'}),
            'status': forms.Select(attrs={'class': 'form-control', 'style': 'width:50%'}),
        }
class AccountForm(forms.ModelForm):
    class Meta:
        model = Account
        fields = ['user','name','phone','email', 'address','type']
        widgets = {
            'user': forms.TextInput(attrs={'class': 'form-control'}),
            'name': forms.TextInput(attrs={'class': 'form-control'}),
            'phone': forms.TextInput(attrs={'class': 'form-control'}),
            'email': forms.EmailInput(attrs={'class': 'form-control'}),
            'address': forms.Textarea(attrs={'class': 'form-control', 'rows':2, 'cols':70}),
            'type': forms.Select(attrs={'class': 'form-control', 'style': 'width:50%'}),
        }
    


