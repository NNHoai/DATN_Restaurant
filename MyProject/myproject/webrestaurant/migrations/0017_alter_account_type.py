# Generated by Django 4.2.7 on 2023-12-26 05:07

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('webrestaurant', '0016_rename_category_product_category'),
    ]

    operations = [
        migrations.AlterField(
            model_name='account',
            name='type',
            field=models.CharField(choices=[('ADMIN', 'Admin'), ('EMPLOYEE', 'Employee'), ('CUSTOMER', 'Customer')], default='CUSTOMER', max_length=20),
        ),
    ]
