# Generated by Django 4.2.7 on 2023-12-26 02:52

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('webrestaurant', '0015_account_type_delete_user'),
    ]

    operations = [
        migrations.RenameField(
            model_name='product',
            old_name='Category',
            new_name='category',
        ),
    ]
