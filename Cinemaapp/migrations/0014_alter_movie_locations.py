# Generated by Django 4.2.9 on 2025-01-20 17:09

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('Cinemaapp', '0013_alter_location_address'),
    ]

    operations = [
        migrations.AlterField(
            model_name='movie',
            name='locations',
            field=models.ManyToManyField(blank=True, to='Cinemaapp.location'),
        ),
    ]
