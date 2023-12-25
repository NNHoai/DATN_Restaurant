from django import forms
from . models import Account, Category, Product, Table, User

from django.contrib.auth.forms import UserCreationForm

class CreateUserForm(UserCreationForm):
    class Meta:
        model = User
        fields = ['username', 'first_name', 'last_name', 'email', 'password1', 'password2']

class ProductForm(forms.ModelForm):
    class Meta:
        model = Product
        fields = ['name', 'price', 'description', 'image', 'active', 'Category']
        widgets = {
            'name': forms.TextInput(attrs={'class': 'form-control'}),
            'price': forms.TextInput(attrs={'class': 'form-control'}),
            'description': forms.Textarea(attrs={'class': 'form-control', 'rows':5, 'cols':70}),
            'image': forms.FileInput(attrs={'class': 'form-control'})
        }

class CategoryForm(forms.ModelForm):
    class Meta:
        model = Category
        fields = ['name', 'active']
        widgets = {
            'name': forms.TextInput(attrs={'class': 'form-control'}),
        }
class TableForm(forms.ModelForm):
    class Meta:
        model = Table
        fields = ['name', 'status']
        widgets = {
            'name': forms.TextInput(attrs={'class': 'form-control'}),
        }
class AccountForm(forms.ModelForm):
    class Meta:
        model = Account
        fields = ['user','name','phone','email', 'address']
        widgets = {
            'name': forms.TextInput(attrs={'class': 'form-control'}),
        }
    


