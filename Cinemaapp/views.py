from django.shortcuts import render
from .models import NewRelease, Event, ComingSoonRelease



def index(request):
    new_releases = NewRelease.objects.all().order_by('-release_date')[:4]

    movies = [new_release.movie for new_release in new_releases]

    events = Event.objects.all()

    coming_soon_releases = ComingSoonRelease.objects.all()[:4]

    # Voeg alles toe aan de context
    return render(request, 'index.html', {
        'movies': movies,
        'events': events,
        'coming_soon_releases': coming_soon_releases
    })


