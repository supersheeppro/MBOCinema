# Generated by Django 4.2.9 on 2025-01-26 14:08

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('Cinemaapp', '0026_ticket_showtime'),
    ]

    operations = [
        migrations.AddField(
            model_name='ticket',
            name='zaal',
            field=models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.CASCADE, related_name='tickets', to='Cinemaapp.zaal'),
        ),
    ]
