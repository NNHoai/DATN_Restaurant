# Generated by Django 4.2.7 on 2023-12-27 07:56

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('webrestaurant', '0018_alter_infobooking_status'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='infobooking',
            name='user',
        ),
        migrations.AddField(
            model_name='infobooking',
            name='account',
            field=models.OneToOneField(null=True, on_delete=django.db.models.deletion.SET_NULL, to='webrestaurant.account'),
        ),
    ]
