from django.contrib import admin
from .models import *

# Register your models here.
admin.site.register(Account)
admin.site.register(Category)
admin.site.register(Product)
admin.site.register(Order)
admin.site.register(OrderItem)
admin.site.register(InfoBooking)
admin.site.register(Table)
admin.site.register(Bill)
admin.site.register(DetailBill)