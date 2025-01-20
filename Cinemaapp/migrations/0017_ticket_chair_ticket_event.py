# Generated by Django 4.2.9 on 2025-01-20 22:06

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('Cinemaapp', '0016_event_genre_event_pegi_rating_event_rating'),
    ]

    operations = [
        migrations.AddField(
            model_name='ticket',
            name='chair',
            field=models.CharField(default='1', max_length=100),
            preserve_default=False,
        ),
        migrations.AddField(
            model_name='ticket',
            name='event',
            field=models.ForeignKey(null=True, on_delete=django.db.models.deletion.CASCADE, to='Cinemaapp.event'),
        ),
    ]
