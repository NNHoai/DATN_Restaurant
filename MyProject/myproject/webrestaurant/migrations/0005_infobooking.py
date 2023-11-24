# Generated by Django 4.2.1 on 2023-07-02 01:08

from django.conf import settings
from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        migrations.swappable_dependency(settings.AUTH_USER_MODEL),
        ('webrestaurant', '0004_remove_order_status_order_complete'),
    ]

    operations = [
        migrations.CreateModel(
            name='InfoBooking',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=100, unique=True)),
                ('phone', models.TextField(max_length=20)),
                ('email', models.EmailField(max_length=100)),
                ('numpeople', models.IntegerField(blank=True, default=0, null=True)),
                ('date_added', models.DateTimeField(auto_now_add=True)),
                ('date_booking', models.DateTimeField()),
                ('description', models.TextField(blank=True, null=True)),
                ('status', models.TextField(blank=True, max_length=100, null=True)),
                ('order', models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.SET_NULL, to='webrestaurant.order')),
                ('user', models.OneToOneField(null=True, on_delete=django.db.models.deletion.SET_NULL, to=settings.AUTH_USER_MODEL)),
            ],
        ),
    ]
