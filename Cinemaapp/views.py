from .models import NewRelease, Event, ComingSoonRelease, Movie, Watchlist, UserProfile, Ticket, Info, Location, Zaal
from django.http import JsonResponse
from django.contrib.auth.decorators import login_required
import json
from django.shortcuts import render, redirect, get_object_or_404
from django.contrib.auth.forms import AuthenticationForm
from django.contrib.auth import login
from django.contrib.auth.models import User
from .models import StandardEventList
from django.http import Http404
from datetime import datetime



def index(request):
    new_releases = NewRelease.objects.all().order_by('-release_date')[:4]

    movies = [new_release.movie for new_release in new_releases]

    events = Event.objects.all()

    coming_soon_releases = ComingSoonRelease.objects.all()[:4]

    return render(request, 'index.html', {
        'movies': movies,
        'events': events,
        'coming_soon_releases': coming_soon_releases
    })


def search(request):
    # Haal de filterwaarden uit de query string
    genre_filter = request.GET.get('genre', None)
    rating_filter = request.GET.get('rating', None)
    name_filter = request.GET.get('name', None)
    zaal_filter = request.GET.get('zaal', None)
    location_filter = request.GET.get('location', None)
    pegi_filter = request.GET.get('pegi_rating', None)
    datum_filter = request.GET.get('datum', None)  # Nieuwe filter voor datum

    # Begin met alle films
    movies = Movie.objects.all()

    # Pas de filters toe indien ze aanwezig zijn
    if genre_filter:
        movies = movies.filter(genre__icontains=genre_filter)
    if rating_filter:
        movies = movies.filter(rating=rating_filter)
    if name_filter:
        movies = movies.filter(title__icontains=name_filter)
    if zaal_filter:
        movies = movies.filter(zaal__title__icontains=zaal_filter)
    if location_filter:
        movies = movies.filter(locations__name__icontains=location_filter)
    if pegi_filter:
        pegi_values = pegi_filter.split(',')  # Split de filterwaarde op basis van komma's
        movies = movies.filter(pegi_rating__in=pegi_values)
    if datum_filter:
        filtered_date = datetime.strptime(datum_filter, '%Y-%m-%d').date()
        movies = movies.filter(showtimes__date=filtered_date)


    zalen = Zaal.objects.all()
    locaties = Location.objects.all()

    # Controleer of de gebruiker ingelogd is
    if request.user.is_authenticated:
        user_watchlist = Watchlist.objects.filter(user=request.user)
        watchlist_movie_ids = user_watchlist.values_list('movie__id', flat=True)
    else:
        # Als de gebruiker niet is ingelogd, is er geen watchlist
        watchlist_movie_ids = []

    # Render de pagina met de gefilterde films
    return render(request, 'search.html', {
        'movies': movies.distinct(),
        'watchlist_movie_ids': watchlist_movie_ids,
        'zalen': zalen,  # Voeg de zalen toe aan de context
        'locaties': locaties,  # Voeg de locaties toe aan de context
    })



@login_required
def add_to_watchlist(request, movie_id):
    if request.method == 'POST':
        user = request.user

        # Verkrijg de actie (add of remove) uit de JSON body
        data = json.loads(request.body)
        action = data.get('action')


        try:
            # Verkrijg de film die bij movie_id hoort
            movie = Movie.objects.get(id=movie_id)

            if action == 'add':
                # Voeg de film toe aan de watchlist van de gebruiker
                watchlist, created = Watchlist.objects.get_or_create(user=user)

                # Voeg de film toe aan de watchlist als deze nog niet in de lijst staat
                if not watchlist.movie.filter(id=movie_id).exists():
                    watchlist.movie.add(movie)
                    return JsonResponse({'message': 'Film toegevoegd aan watchlist'}, status=200)
                else:
                    return JsonResponse({'error': 'Film is al toegevoegd aan de watchlist'}, status=400)

            elif action == 'remove':
                # Verwijder de film van de watchlist van de gebruiker
                watchlist = Watchlist.objects.get(user=user)

                # Verwijder de film uit de watchlist als deze aanwezig is
                if watchlist.movie.filter(id=movie_id).exists():
                    watchlist.movie.remove(movie)
                    return JsonResponse({'message': 'Film verwijderd van watchlist'}, status=200)
                else:
                    return JsonResponse({'error': 'Film niet gevonden in de watchlist'}, status=400)

        except Movie.DoesNotExist:
            return JsonResponse({'error': 'Film niet gevonden'}, status=404)

    return JsonResponse({'error': 'Ongeldige request methode'}, status=405)



def event_list_detail(request, list_id):
    # Haal de specifieke StandardEventList op
    event_list = StandardEventList.objects.get(id=list_id)

    # Haal de zoekterm op van de GET-parameter (indien aanwezig)
    search_query = request.GET.get('search', '')  # Zoekopdracht in de vorm van 'naam:waarde'

    genre_filter = request.GET.get('genre', None)
    rating_filter = request.GET.get('rating', None)
    name_filter = request.GET.get('name', None)
    zaal_filter = request.GET.get('zaal', None)
    pegi_filter = request.GET.get('pegi_rating', None)
    datum_filter = request.GET.get('datum', None)  # Nieuwe filter voor datum

    # Filter de evenementen die tot deze lijst behoren
    events_in_list = event_list.events.all()

    # Pas de filters toe indien ze aanwezig zijn
    if genre_filter:
        events_in_list = events_in_list.filter(genre__icontains=genre_filter)
    if rating_filter:
        events_in_list = events_in_list.filter(rating=rating_filter)
    if name_filter:
        events_in_list = events_in_list.filter(title__icontains=name_filter)
    if zaal_filter:
        events_in_list = events_in_list.filter(zaal__title__icontains=zaal_filter)
    if pegi_filter:
        pegi_values = pegi_filter.split(',')  # Split de filterwaarde op basis van komma's
        events_in_list = events_in_list.filter(pegi_rating__in=pegi_values)
    if datum_filter:
        filtered_date = datetime.strptime(datum_filter, '%Y-%m-%d').date()
        events_in_list = events_in_list.filter(showtimes__date=filtered_date)


    zalen = Zaal.objects.all()
    # Haal de eerste vier evenementen die **niet** in deze lijst staan
    events_outside_list = Event.objects.exclude(event_lists=event_list)[:4]

    # Render de template en geef de context door
    return render(request, 'events.html', {
        'event_list': event_list,
        'events_in_list': events_in_list,
        'events_outside_list': events_outside_list,
        'search_query': search_query,
        'zalen':zalen,
    })


def movie_detail(request, movie_id):
    # Haal de gekozen film op via de ID
    movie = get_object_or_404(Movie, id=movie_id)

    # Haal de eerste 4 films op die niet dezelfde zijn als de gekozen film
    other_movies = Movie.objects.exclude(id=movie_id)[:4]

    # Stuur de film en de andere films naar de template
    return render(request, 'film_detail.html', {
        'movie': movie,
        'other_movies': other_movies
    })

def event_detail(request, event_id):
    # Haal de gekozen film op via de ID
    event = get_object_or_404(Event, id=event_id)

    return render(request, 'event_detail.html', {
        'event': event,
    })

def login_register_view(request):
    if request.user.is_authenticated:
        user_profile = UserProfile.objects.filter(user=request.user).first()
        return render(request, 'account.html', {
            'is_authenticated': True,
            'user_profile': user_profile,  # Voeg profiel toe aan context
        })

    if request.method == 'POST':
        if 'login' in request.POST:
            # Verwerk login
            form = AuthenticationForm(request, data=request.POST)
            if form.is_valid():
                user = form.get_user()
                login(request, user)
                return redirect('login_register')
        elif 'register' in request.POST:
            # Verwerk registratie
            gebruikersnaam = request.POST.get('gebruikersnaam')
            voornaam = request.POST.get('voornaam')
            achternaam = request.POST.get('achternaam')
            email = request.POST.get('email')
            geboortedatum = request.POST.get('geboortedatum')
            wachtwoord1 = request.POST.get('wachtwoord')
            wachtwoord2 = request.POST.get('bevestigwachtwoord')
            nieuwsbrief = request.POST.get('nieuwsbrief') == 'on'  # Checkbox waarde
            postcode = request.POST.get('postcode')
            telefoonnummer = request.POST.get('telefoonnummer')
            gender = request.POST.get('gender')

            # Controleer of wachtwoorden overeenkomen
            if wachtwoord1 == wachtwoord2:
                if not User.objects.filter(username=gebruikersnaam).exists():
                    user = User.objects.create_user(
                        username=gebruikersnaam,
                        password=wachtwoord1,
                        email=email,
                        first_name=voornaam,
                        last_name=achternaam
                    )
                    profile = user.userprofile
                    print(profile)
                    print(profile.birthday)
                    profile.birthday = geboortedatum
                    profile.mail_subscribed = nieuwsbrief
                    profile.postcode = postcode
                    profile.phone = telefoonnummer
                    profile.gender = gender
                    profile.save()
                    print("Profiel opgeslagen:", profile.birthday, profile.mail_subscribed, profile.postcode)

                    print(profile.birthday)

                    login(request, user)
                    return redirect('login_register')
                else:
                    # Voeg een foutmelding toe (gebruik context of Django messages)
                    return render(request, 'account.html', {
                        'is_authenticated': False,
                        'error': 'Gebruikersnaam bestaat al.'
                    })
            else:
                # Voeg een foutmelding toe (wachtwoorden komen niet overeen)
                return render(request, 'account.html', {
                    'is_authenticated': False,
                    'error': 'Wachtwoorden komen niet overeen.'
                })

    return render(request, 'account.html', {'is_authenticated': False})


@login_required
def winkelmand(request):
    # Haal alle tickets op die bij de ingelogde gebruiker horen
    tickets = Ticket.objects.filter(user=request.user)

    # Bereken het totale bedrag van de tickets in de winkelmand
    total_price = sum(ticket.price for ticket in tickets)

    # Stuur de tickets en het totale bedrag naar de template
    return render(request, 'winkelmand.html', {
        'tickets': tickets,
        'total_price': total_price
    })

def checkout(request):
    # Als de gebruiker is ingelogd, haal dan de tickets op
    tickets = Ticket.objects.filter(user=request.user) if request.user.is_authenticated else []

    # Als de gebruiker niet ingelogd is, kunnen we een variabele toevoegen
    is_authenticated = request.user.is_authenticated

    return render(request, 'checkout.html', {
        'tickets': tickets,
        'is_authenticated': is_authenticated,
    })


def info(request):
    # Haal het eerste Info-object op uit de database
    info_item = Info.objects.first()
    return render(request, 'info.html', {'info': info_item})

def location_list(request):
    # Haal alle locaties op
    locations = Location.objects.all()
    return render(request, 'locations.html', {'locations': locations})

def location_detail(request, location_id):
    # Haal de specifieke locatie op
    location = Location.objects.get(id=location_id)
    return JsonResponse({
        'name': location.name,
        'address': location.address,
        'description': location.description,
        'photo_url': location.photo.url if location.photo else None,
    })
