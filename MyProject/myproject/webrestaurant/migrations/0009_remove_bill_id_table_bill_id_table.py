# Generated by Django 4.2.7 on 2023-12-15 14:28

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('webrestaurant', '0008_alter_bill_date_checkout_alter_bill_total_price'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='bill',
            name='id_table',
        ),
        migrations.AddField(
            model_name='bill',
            name='id_table',
            field=models.ManyToManyField(to='webrestaurant.table'),
        ),
    ]
