
from django.db import models
from django.contrib.auth.models import User


class Movie(models.Model):
    ACTION = 'Action'
    DRAMA = 'Drama'
    COMEDY = 'Comedy'
    HORROR = 'Horror'
    SCIFI = 'Sci-Fi'
    ROMANCE = 'Romance'

    GENRE_CHOICES = [
        (ACTION, 'Action'),
        (DRAMA, 'Drama'),
        (COMEDY, 'Comedy'),
        (HORROR, 'Horror'),
        (SCIFI, 'Sci-Fi'),
        (ROMANCE, 'Romance'),
    ]

    title = models.CharField(max_length=200)
    description = models.TextField()
    release_date = models.DateField()
    duration = models.PositiveIntegerField()  # Duur in minuten
    poster = models.ImageField(upload_to='posters/')
    rating = models.DecimalField(max_digits=3, decimal_places=1, null=True, blank=True)
    genre = models.CharField(
        max_length=50,
        choices=GENRE_CHOICES,  # Keuzelijst van genres
        default=ACTION,  # Stel een standaardgenre in, bijvoorbeeld "Action"
    )

    def __str__(self):
        return self.title






class NewRelease(models.Model):
    movie = models.ForeignKey(Movie, on_delete=models.CASCADE, related_name='new_releases')
    release_date = models.DateField()  # Release datum
    is_featured = models.BooleanField(default=False)  # Is de film een aanbevolen release?

    def __str__(self):
        return f"Nieuwe Film: {self.movie.title} - {self.release_date}"


class ComingSoonRelease(models.Model):
    title = models.CharField(max_length=200, null=True)  # Titel van de film
    description = models.TextField(null=True)  # Beschrijving van de film
    release_date = models.DateField(null=True)  # Verwachte release datum
    poster = models.ImageField(upload_to='coming_soon_posters/')  # Poster afbeelding voor de film
    is_featured = models.BooleanField(default=False)  # Is het een aanbevolen coming soon release?

    def __str__(self):
        return f"Coming Soon: {self.title} - {self.release_date}"


class Event(models.Model):
    title = models.CharField(max_length=200)  # Titel van het evenement
    description = models.TextField()  # Beschrijving van het evenement
    date = models.DateTimeField()  # Datum en tijd van het evenement
    poster = models.ImageField(upload_to='posters/', blank=True, null=True)
    location = models.CharField(max_length=255)  # Locatie van het evenement
    movie = models.ForeignKey(Movie, on_delete=models.CASCADE, related_name='events')  # Koppeling naar een film

    def __str__(self):
        return f"Evenement: {self.title} - {self.date}"


