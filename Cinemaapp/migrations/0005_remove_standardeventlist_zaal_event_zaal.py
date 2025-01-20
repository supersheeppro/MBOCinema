# Generated by Django 4.2.9 on 2025-01-19 23:48

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('Cinemaapp', '0004_zaal_movie_zaal_standardeventlist_zaal'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='standardeventlist',
            name='zaal',
        ),
        migrations.AddField(
            model_name='event',
            name='zaal',
            field=models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.CASCADE, related_name='events_in_zaal', to='Cinemaapp.zaal'),
        ),
    ]
