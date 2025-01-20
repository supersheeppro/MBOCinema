from django.contrib import admin
from .models import Movie, Event, NewRelease, ComingSoonRelease, ShowTime, Feature, UserProfile, Ticket, Watchlist, StandardEventList, Zaal, Info, Location
from django.contrib.auth.admin import UserAdmin as BaseUserAdmin
from django.contrib.auth.models import User

class FeatureAdmin(admin.ModelAdmin):
    list_display = ('name',)


class ShowTimeInline(admin.TabularInline):
    model = ShowTime
    extra = 1

class LocationInline(admin.TabularInline):
    model = Movie.locations.through
    extra = 1  #

class MovieAdmin(admin.ModelAdmin):
    list_display = ('title', 'release_date', 'pegi_rating', 'duration', 'rating', 'zaal')
    search_fields = ('title', 'genre', 'zaal__title')
    list_filter = ('release_date', 'pegi_rating', 'rating', 'features')
    filter_horizontal = ('features',)
    ordering = ('release_date',)
    inlines = [ShowTimeInline, LocationInline]
    exclude = ('locations',)

class InfoAdmin(admin.ModelAdmin):
    list_display = ('title',)

class EventInline(admin.TabularInline):
    model = StandardEventList.events.through  # Koppelt de Many-to-Many-relatie
    extra = 1  # Het aantal lege regels die standaard worden toegevoegd
    verbose_name = 'Evenement'
    verbose_name_plural = 'Evenementen'

    # Voeg een mogelijkheid toe om evenementen te verwijderen
    def has_delete_permission(self, request, obj=None):
        return True  # Hierdoor kunnen evenementen verwijderd worden uit de event list

class StandardEventListAdmin(admin.ModelAdmin):
    inlines = [EventInline]
    list_display = ('title', 'description')  # Velden die in de lijstweergave worden getoond
    search_fields = ('title',)

class EventAdmin(admin.ModelAdmin):
    list_display = ('title', 'date', 'location', 'movie', 'zaal')
    search_fields = ('title', 'movie__title', 'location', 'zaal__title')
    list_filter = ('date', 'movie')
    ordering = ('date',)


class NewReleaseAdmin(admin.ModelAdmin):
    list_display = ('movie', 'release_date', 'is_featured')
    search_fields = ('movie__title',)
    list_filter = ('release_date', 'is_featured')
    ordering = ('release_date',)

class ComingSoonReleaseAdmin(admin.ModelAdmin):
    list_display = ('title', 'release_date', 'is_featured')
    list_filter = ('release_date', 'is_featured')
    search_fields = ('title',)
    ordering = ('release_date',)

class UserProfileInline(admin.StackedInline):
    model = UserProfile
    can_delete = False
    verbose_name_plural = 'User Profile'

class UserAdmin(BaseUserAdmin):
    inlines = (UserProfileInline,)

# Unregister the original User admin
admin.site.unregister(User)

# Register the new User admin with the inline
@admin.register(User)
class CustomUserAdmin(UserAdmin):
    inlines = (UserProfileInline,)


class WatchlistAdmin(admin.ModelAdmin):
    list_display = ('user',)
    filter_horizontal = ('movie',)

class ZaalAdmin(admin.ModelAdmin):
    list_display = ('title',)  # Toon de naam van de zaal
    filter_horizontal = ('films', 'events')  # Zorg ervoor dat de films en evenementen makkelijk gekozen kunnen worden

@admin.register(Location)
class LocationAdmin(admin.ModelAdmin):
    list_display = ('name', 'address', 'description' )

admin.site.register(Zaal, ZaalAdmin)
admin.site.register(Feature)
admin.site.register(ComingSoonRelease, ComingSoonReleaseAdmin)
admin.site.register(Movie, MovieAdmin)
admin.site.register(Event, EventAdmin)
admin.site.register(NewRelease, NewReleaseAdmin)
admin.site.register(ShowTime)
admin.site.register(Ticket)
admin.site.register(Watchlist, WatchlistAdmin)
admin.site.register(StandardEventList, StandardEventListAdmin)
admin.site.register(Info, InfoAdmin)

