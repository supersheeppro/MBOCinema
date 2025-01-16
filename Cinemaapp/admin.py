from django.contrib import admin
from .models import Movie, Event, NewRelease, ComingSoonRelease


class MovieAdmin(admin.ModelAdmin):
    list_display = ('title', 'release_date', 'duration', 'rating')  # Velden die je wilt tonen in de lijst
    search_fields = ('title', 'genre')  # Zoeken op deze velden
    list_filter = ('release_date', 'rating')  # Filteren op deze velden
    ordering = ('release_date',)  # Sorteren op release_date


class EventAdmin(admin.ModelAdmin):
    list_display = ('title', 'date', 'location', 'movie')
    search_fields = ('title', 'movie__title', 'location')
    list_filter = ('date', 'movie')
    ordering = ('date',)


class NewReleaseAdmin(admin.ModelAdmin):
    list_display = ('movie', 'release_date', 'is_featured')
    search_fields = ('movie__title',)
    list_filter = ('release_date', 'is_featured')
    ordering = ('release_date',)

class ComingSoonReleaseAdmin(admin.ModelAdmin):
    list_display = ('title', 'release_date', 'is_featured')  # Toon de titel, release datum, en of het een featured film is
    list_filter = ('release_date', 'is_featured')  # Filteren op datum en featured status
    search_fields = ('title',)  # Zoek op titel van de film
    ordering = ('release_date',)  # Sorteer op de release datum


admin.site.register(ComingSoonRelease, ComingSoonReleaseAdmin)
admin.site.register(Movie, MovieAdmin)
admin.site.register(Event, EventAdmin)
admin.site.register(NewRelease, NewReleaseAdmin)



