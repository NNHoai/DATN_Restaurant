from django.db import models
from django.contrib.auth.models import User
from django.contrib.auth.models import AbstractUser
from django.contrib.auth.forms import UserCreationForm

class CreateUserForm(UserCreationForm):
    class Meta:
        model = User
        fields = ['username', 'first_name', 'last_name', 'email', 'password1', 'password2']

class Account(models.Model):
    user = models.OneToOneField(User, on_delete=models.SET_NULL, null=True, blank=False)
    name = models.CharField(max_length=100, null=False)
    phone = models.TextField(max_length=20, null=False, blank=False)
    email = models.EmailField(max_length=100, null=False, blank=False)
    address = models.TextField(max_length=255, null=False, blank=False)
    
    def __str__(self):
        return str(self.id)
    
class Category(models.Model):
    name = models.CharField(max_length=100, null=False, unique=True)
    def __str__(self):
        return str(self.id)
    
class Product(models.Model):
    name = models.CharField(max_length=100, null=False, unique=True)
    price = models.DecimalField(max_digits=10, decimal_places=2)
    description = models.TextField(null=True, blank=True)
    active = models.BooleanField(default=True)
    Category = models.ForeignKey(Category, on_delete=models.SET_NULL, null=True)
    image = models.ImageField(null=True, blank=True)
    date_added = models.DateTimeField(auto_now_add=True)
    def __str__(self):
        return str(self.id)
    
class Order(models.Model):
    account = models.ForeignKey(Account, on_delete=models.SET_NULL, blank=True, null=True)
    date_order = models.DateTimeField(auto_now_add=True)
    description = models.TextField(null=True, blank=True)
    complete = models.BooleanField(default=False, null=True, blank=False)
    transaction_id = models.CharField(max_length=255, null=True)
    
    def __str__(self):
        return str(self.id)
    
    @property
    def get_cart_items(self):
        orderitems = self.orderitem_set.all()
        total = sum([item.quantity for item in orderitems])
        return total
    @property
    def get_cart_total(self):
        orderitems = self.orderitem_set.all()
        total = sum([item.get_total for item in orderitems])
        return total

class OrderItem(models.Model):
    product = models.ForeignKey(Product, on_delete=models.SET_NULL, blank=True, null=True)
    order = models.ForeignKey(Order, on_delete=models.SET_NULL,  blank=True, null=True)
    quantity = models.IntegerField(default=0, null=True, blank=True)
    date_added = models.DateTimeField(auto_now_add=True)

    def __str__(self):
        return str(self.id)
    
    @property
    def get_total(self):
        total = self.product.price * self.quantity
        return total
    
class InfoBooking(models.Model):
    user = models.OneToOneField(User, on_delete=models.SET_NULL, null=True, blank=False)
    order = models.ForeignKey(Order, on_delete=models.SET_NULL,  blank=True, null=True)
    name = models.CharField(max_length=100, null=False, unique=True)
    phone = models.TextField(max_length=20, null=False, blank=False)
    email = models.EmailField(max_length=100, null=False, blank=False)
    numpeople = models.IntegerField(default=0, null=True, blank=True)
    date_added = models.DateTimeField(auto_now_add=True)
    date_booking = models.DateTimeField()
    description = models.TextField(null=True, blank=True)
    status = models.TextField(max_length=100, null=True, blank=True)

class Table(models.Model):
    name = models.CharField(max_length=100, null=False, unique=True)
    status = models.CharField(
        max_length=10,
        choices=[('empty','Empty'), ('busy', 'Busy')]
    )
    def __str__(self):
        return str(self.id)

class Bill(models.Model):
    account = models.ForeignKey(Account, on_delete=models.SET_NULL, blank=True, null=True)
    date_created = models.DateTimeField(auto_now_add=True)
    date_checkout = models.TextField(max_length=100, null=True, blank=True)
    id_table = models.ForeignKey(Table, on_delete=models.SET_NULL, blank=True, null=True)
    total_price = models.DecimalField(max_digits=10, decimal_places=1,blank=True, default=0)
    status = models.CharField(
        max_length=10,
        choices=[('unpaid', 'Unpaid'), ('paid', 'Paid')]
    )
    def __str__(self):
        return str(self.id)
    
    @property
    def get_bill_total(self):
        orderitems = self.detailbill_set.all()
        total = sum([item.get_total for item in orderitems])
        return total

class DetailBill(models.Model):
    bill = models.ForeignKey(Bill, on_delete=models.SET_NULL,  blank=True, null=True)
    product = models.ForeignKey(Product, on_delete=models.SET_NULL, blank=True, null=True)
    quantity = models.IntegerField(default=0, null=True, blank=True)
    
    def __str__(self):
        return str(self.id)
    
    @property
    def get_total(self):
        total = self.product.price * self.quantity
        return total