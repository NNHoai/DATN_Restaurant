# Generated by Django 4.2.1 on 2023-06-19 10:48

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('webrestaurant', '0001_initial'),
    ]

    operations = [
        migrations.AddField(
            model_name='product',
            name='image',
            field=models.ImageField(blank=True, null=True, upload_to=''),
        ),
    ]
