from django.db import models
from django.contrib.auth.models import User
from django.utils import timezone


class Zaal(models.Model):
    title = models.CharField(max_length=200)  # Naam van de zaal
    films = models.ManyToManyField('Movie', related_name='zaals')  # Films in de zaal
    events = models.ManyToManyField('Event', related_name='zaals')  # Evenementen in de zaal

    def __str__(self):
        return f"Zaal: {self.title}"

class Feature(models.Model):
    SCARY = 'Scary'
    SEXUAL_CONTENT = 'Sexual Content'
    VIOLENCE = 'Violence'
    LANGUAGE = 'Strong Language'

    FEATURES_CHOICES = [
        (SCARY, 'Scary'),
        (SEXUAL_CONTENT, 'Sexual Content'),
        (VIOLENCE, 'Violence'),
        (LANGUAGE, 'Strong Language'),
    ]

    name = models.CharField(
        max_length=50,
        choices=FEATURES_CHOICES,
        unique=True,
    )

    def __str__(self):
        return self.get_name_display()


class Location(models.Model):
    name = models.CharField(max_length=100)  # Naam van de locatie
    address = models.CharField(max_length=255) # Adres van de locatie
    description = models.TextField(blank=True, null=True)  # Optionele beschrijving
    photo = models.ImageField(upload_to='location_photos/', null=True, blank=True)  # Foto van de locatie

    def __str__(self):
        return self.name

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

    PEGI_3 = '3'
    PEGI_7 = '7'
    PEGI_12 = '12'
    PEGI_16 = '16'
    PEGI_18 = '18'

    PEGI_CHOICES = [
        (PEGI_3, 'PEGI 3'),
        (PEGI_7, 'PEGI 7'),
        (PEGI_12, 'PEGI 12'),
        (PEGI_16, 'PEGI 16'),
        (PEGI_18, 'PEGI 18'),
    ]

    title = models.CharField(max_length=200)
    description = models.TextField()
    release_date = models.DateField()
    duration = models.PositiveIntegerField()  # Duur in minuten
    poster = models.ImageField(upload_to='posters/')
    rating = models.DecimalField(max_digits=3, decimal_places=1, null=True, blank=True)
    genre = models.CharField(
        max_length=50,
        choices=GENRE_CHOICES,
        default=ACTION,
    )
    pegi_rating = models.CharField(
        max_length=2,
        choices=PEGI_CHOICES,
        default=PEGI_3,
    )
    features = models.ManyToManyField(Feature, blank=True)
    zaal = models.ForeignKey(Zaal, on_delete=models.CASCADE, related_name='movies', null=True, blank=True)
    video = models.FileField(upload_to='movies/', null=True, blank=True)
    locations = models.ManyToManyField('Location', related_name='movies', blank=True)

    def __str__(self):
        return self.title


class StandardEventList(models.Model):
    title = models.CharField(max_length=200)  # Titel van de eventlijst
    description = models.TextField()  # Beschrijving van de eventlijst
    image = models.ImageField(upload_to='event_lists/', blank=True, null=True)  # Eventlijst afbeelding
    events = models.ManyToManyField('Event', related_name='event_lists')  # Veel-op-veel relatie met Event

    def __str__(self):
        return f"Event List: {self.title}"


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
    PEGI_3 = '3'
    PEGI_7 = '7'
    PEGI_12 = '12'
    PEGI_16 = '16'
    PEGI_18 = '18'

    PEGI_CHOICES = [
        (PEGI_3, 'PEGI 3'),
        (PEGI_7, 'PEGI 7'),
        (PEGI_12, 'PEGI 12'),
        (PEGI_16, 'PEGI 16'),
        (PEGI_18, 'PEGI 18'),
    ]
    title = models.CharField(max_length=200)  # Titel van het evenement
    description = models.TextField()  # Beschrijving van het evenement
    date = models.DateTimeField()  # Datum en tijd van het evenement
    rating = models.DecimalField(max_digits=3, decimal_places=1, null=True, blank=True)
    poster = models.ImageField(upload_to='events/', blank=True, null=True)
    location = models.CharField(max_length=255)  # Locatie van het evenement
    movie = models.ForeignKey(Movie, on_delete=models.CASCADE, related_name='events')  # Koppeling naar een film
    thumbnail = models.ImageField(upload_to='event_thumbnails/', blank=True, null=True)
    zaal = models.ForeignKey('Zaal', on_delete=models.CASCADE, related_name='events_in_zaal', blank=True, null=True)
    genre = models.CharField(
        max_length=50,
        choices=GENRE_CHOICES,
        default=ACTION,
    )
    pegi_rating = models.CharField(
        max_length=2,
        choices=PEGI_CHOICES,
        default=PEGI_3,
    )

    def __str__(self):
        return f"Evenement: {self.title} - {self.date}"



class ShowTime(models.Model):
    movie = models.ForeignKey('Movie', on_delete=models.CASCADE, related_name='showtimes')
    start_time = models.TimeField()
    end_time = models.TimeField()
    date = models.DateField(default=timezone.now)


    def __str__(self):
        return f"{self.start_time} - {self.end_time}"


class Ticket(models.Model):
    user = models.ForeignKey(User, on_delete=models.CASCADE, related_name='tickets', blank=True, null=True)
    film = models.ForeignKey(Movie, on_delete=models.CASCADE, blank=True, null=True)
    event = models.ForeignKey(Event, on_delete=models.CASCADE, blank=True, null=True)
    purchased_on = models.DateTimeField(auto_now_add=True)
    ticket_type = models.CharField(max_length=100)  # Bijvoorbeeld: "VIP", "Standard", etc.
    chair = models.CharField(max_length=100)
    price = models.DecimalField(max_digits=10, decimal_places=2)

    def __str__(self):
        return f"Ticket voor {self.user.username}"


class UserProfile(models.Model):
    user = models.OneToOneField(User, on_delete=models.CASCADE)

    # Extra velden
    birthday = models.DateField(blank=True, null=True)
    phone = models.CharField(max_length=15, blank=True, null=True)
    mail_subscribed = models.BooleanField(default=False)
    gender = models.CharField(max_length=10, choices=[('M', 'Male'), ('F', 'Female'), ('O', 'Other')], blank=True, null=True)
    postcode = models.CharField(max_length=10, blank=True, null=True)

    def __str__(self):
        return self.user.username

class Watchlist(models.Model):
    user = models.OneToOneField(User, on_delete=models.CASCADE, related_name='watchlist')  # Relatie naar gebruiker (1-op-1)
    movie = models.ManyToManyField(Movie, related_name='watchlisted_by')  # Relatie naar films (veel-op-veel)
    added_on = models.DateTimeField(auto_now_add=True)  # Datum waarop de film werd toegevoegd

    def __str__(self):
        return f"{self.user.username}'s Watchlist"

class Info(models.Model):
    title = models.CharField(max_length=200)
    info = models.TextField()
    image = models.ImageField(upload_to='images/', blank=True, null=True)

    def __str__(self):
        return self.title


