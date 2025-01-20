# Generated by Django 4.2.9 on 2025-01-20 21:51

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('Cinemaapp', '0015_alter_movie_locations'),
    ]

    operations = [
        migrations.AddField(
            model_name='event',
            name='genre',
            field=models.CharField(choices=[('Action', 'Action'), ('Drama', 'Drama'), ('Comedy', 'Comedy'), ('Horror', 'Horror'), ('Sci-Fi', 'Sci-Fi'), ('Romance', 'Romance')], default='Action', max_length=50),
        ),
        migrations.AddField(
            model_name='event',
            name='pegi_rating',
            field=models.CharField(choices=[('3', 'PEGI 3'), ('7', 'PEGI 7'), ('12', 'PEGI 12'), ('16', 'PEGI 16'), ('18', 'PEGI 18')], default='3', max_length=2),
        ),
        migrations.AddField(
            model_name='event',
            name='rating',
            field=models.DecimalField(blank=True, decimal_places=1, max_digits=3, null=True),
        ),
    ]
