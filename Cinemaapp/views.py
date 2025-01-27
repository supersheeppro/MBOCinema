from .models import NewRelease, Event, ComingSoonRelease, Movie, Watchlist, UserProfile, Ticket, Info, Location, Zaal, Reservation, StandardEventList, ShowTime
from django.http import JsonResponse, Http404
from django.contrib.auth.decorators import login_required
import json
from django.shortcuts import render, redirect, get_object_or_404
from django.contrib.auth.forms import AuthenticationForm
from django.contrib.auth import login, logout
from django.contrib.auth.models import User
from datetime import datetime
from django.contrib.auth.views import PasswordChangeView
from django.urls import reverse_lazy
from .forms import CustomPasswordChangeForm
from django.views.generic import TemplateView
from django.utils import timezone
from django.core.mail import send_mail
from django.urls import reverse
from django.http import HttpResponse

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
def create_ticket(request):
    if request.method == 'POST':
        tickets_data = []
        index = 0
        while True:
            ticket_type = request.POST.get(f'type_{index}')
            if ticket_type is None:
                break  # Geen meer stoelen
            seat = request.POST.get(f'seat_{index}')
            seat_row = request.POST.get(f'seat_row_{index}')
            zaal_id = request.POST.get(f'seat_room_{index}')
            vip = request.POST.get(f'vip_{index}') == "True"  # Zet VIP om naar boolean
            price = request.POST.get(f'price_{index}')
            movie_id = request.POST.get(f'movie_id_{index}')
            event_id = request.POST.get(f'event_id_{index}')
            showtime_id = request.POST.get(f'showtime_id_{index}')
            # Verkrijg de film en het evenement alleen als ze zijn opgegeven
            movie = None
            event = None
            zaal = None
            showTime = None

            if movie_id:
                try:
                    movie = Movie.objects.get(id=movie_id)
                except Movie.DoesNotExist:
                    return JsonResponse({'error': 'Film niet gevonden'}, status=404)

            if event_id:
                try:
                    event = Event.objects.get(id=event_id)
                except Event.DoesNotExist:
                    return JsonResponse({'error': 'Evenement niet gevonden'}, status=404)

            if zaal_id:
                try:
                    zaal = Zaal.objects.get(id=zaal_id)
                except Zaal.DoesNotExist:
                    return JsonResponse({'error': 'Zaal niet gevonden'}, status=404)

            if showtime_id:
                try:
                    showTime = ShowTime.objects.get(id=showtime_id)
                except ShowTime.DoesNotExist:
                    return JsonResponse({'error': 'ShowTime niet gevonden'}, status=404)

            # Voeg de stoelgegevens toe aan de lijst
            tickets_data.append({
                'type': ticket_type,
                'seat': seat,
                'seat_row': seat_row,
                'seat_room': zaal,
                'vip': vip,
                'price': price,
                'film': movie,
                'event': event,
                'showTime': showTime,
            })

            index += 1

        # Maak de tickets aan in de database
        for ticket_data in tickets_data:
            Ticket.objects.create(
                user=request.user,  # De gebruiker die het ticket aanmaakt
                film=ticket_data['film'],  # De film (kan None zijn)
                event=ticket_data['event'],  # Het evenement (kan None zijn)
                type=ticket_data['type'],  # Het type ticket
                seat=ticket_data['seat'],  # De stoel waarvoor het ticket is
                row=ticket_data['seat_row'],  # De rij van de stoel
                zaal=ticket_data['seat_room'],  # De zaal
                showtime=ticket_data['showTime'],
                vip=ticket_data['vip'],  # VIP-status
                price=ticket_data['price'],  # De prijs van het ticket
                purchased_on=timezone.now()  # Tijdstip van aankoop
            )

        return redirect('/winkelmand')

    return JsonResponse({'error': 'Ongeldige request methode'}, status=405)

def create_reservation(request):
    if request.method == 'POST':

        reservations_data_data = []
        index = 0
        session_id = request.session.session_key  # Verkrijg de session_key
        if not session_id:  # Als er geen sessie is, maak een nieuwe sessie
            request.session.create()
            session_id = request.session.session_key

        while True:
            ticket_type = request.POST.get(f'type_{index}')
            if ticket_type is None:
                break  # Geen meer stoelen

            seat = request.POST.get(f'seat_{index}')
            seat_row = request.POST.get(f'seat_row_{index}')
            zaal_id = request.POST.get(f'seat_room_{index}')
            vip = request.POST.get(f'vip_{index}') == "True"  # Zet VIP om naar boolean
            price = request.POST.get(f'price_{index}')
            movie_id = request.POST.get(f'movie_id_{index}')
            event_id = request.POST.get(f'event_id_{index}')
            showtime_id = request.POST.get(f'showtime_id_{index}')


            # Verkrijg de film en het evenement alleen als ze zijn opgegeven
            movie = None
            event = None
            zaal = None
            showTime = None

            if movie_id:
                try:
                    movie = Movie.objects.get(id=movie_id)
                except Movie.DoesNotExist:
                    return JsonResponse({'error': 'Film niet gevonden'}, status=404)

            if event_id:
                try:
                    event = Event.objects.get(id=event_id)
                except Event.DoesNotExist:
                    return JsonResponse({'error': 'Evenement niet gevonden'}, status=404)

            if zaal_id:
                try:
                    zaal = Zaal.objects.get(id=zaal_id)
                except Zaal.DoesNotExist:
                    return JsonResponse({'error': 'Zaal niet gevonden'}, status=404)

            if showtime_id:
                try:
                    showTime = ShowTime.objects.get(id=showtime_id)
                except ShowTime.DoesNotExist:
                    return JsonResponse({'error': 'ShowTime niet gevonden'}, status=404)

            # Voeg de stoelgegevens toe aan de lijst
            reservations_data_data.append({
                'type': ticket_type,
                'seat': seat,
                'seat_row': seat_row,
                'seat_room': zaal,
                'vip': vip,
                'price': price,
                'film': movie,
                'event': event,
                'showTime': showTime,
            })

            index += 1

        # Check of de gebruiker is ingelogd
        if request.user.is_authenticated:
            user = request.user
            guest_name = None
            guest_email = None
        else:
            # Als de gebruiker niet ingelogd is, haal gastgegevens op
            user = None  # Dit is belangrijk voor gastgebruikers
            guest_name = f"{request.POST.get('voornaam')} {request.POST.get('achternaam')}"
            guest_email = request.POST.get('email')


        # Maak de tickets aan in de database
        for reservation_data in reservations_data_data:
            Reservation.objects.create(
                user=user,  # Als ingelogd, gebruik de ingelogde gebruiker, anders None voor gast
                film=reservation_data['film'],
                event=reservation_data['event'],
                type=reservation_data['type'],
                seat=reservation_data['seat'],
                row=reservation_data['seat_row'],
                zaal=reservation_data['seat_room'],
                showtime=reservation_data['showTime'],
                vip=reservation_data['vip'],
                price=reservation_data['price'],
                session_id=session_id,  # Sla de session_id op voor gasten
                guest_name=guest_name,  # Sla de naam op voor gasten
                guest_email=guest_email,  # Sla het e-mailadres op voor gasten
                reserved_on=timezone.now()
            )

            # Stuur een bevestigingsmail naar de gebruiker of gast
            recipient_email = user.email if user else guest_email

            # Genereer de link voor gastgebruikers
            if not user:
                reservations_url = reverse('guest_reservations', kwargs={'session_id': session_id})
                reservation_link = f"http://127.0.0.1:8000{reservations_url}"

                # Voeg de link toe in de e-mailbody
                email_body = f"""
                    Hallo {guest_name},

                    Je hebt succesvol een reservering gemaakt voor de film: {reservation_data['film']}.

                    Je kunt je reserveringen bekijken door de onderstaande link te volgen:
                    {reservation_link}

                    Bedankt voor je reservering!
                """
            else:
                email_body = f"""
                    Hallo {user.get_full_name()},

                    Je hebt succesvol een reservering gemaakt voor de film: {reservation_data['film']}.

                    Bedankt voor je reservering!
                """

            send_mail(
                'Bevestiging van je reservering',
                email_body,
                'from@example.com',  # Gebruik een geldig e-mailadres
                [recipient_email],
                fail_silently=False,
            )

        if request.user.is_authenticated:
            return redirect('/account')
        else:
            return redirect(f'/reservation_complete/{session_id}')

    return JsonResponse({'error': 'Ongeldige request methode'}, status=405)

@login_required
def remove_from_watchlist(request, movie_id):
    try:
        # Verkrijg de film die je wilt verwijderen
        movie = get_object_or_404(Movie, id=movie_id)

        # Verkrijg of maak een watchlist voor de gebruiker
        watchlist, created = Watchlist.objects.get_or_create(user=request.user)

        # Verwijder de film uit de watchlist als deze aanwezig is
        if watchlist.movie.filter(id=movie_id).exists():
            watchlist.movie.remove(movie)

        return redirect('/account')

    except Movie.DoesNotExist:
        return JsonResponse({'error': 'Film niet gevonden'}, status=404)

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

def movie_detail(request, movie_id, showtime_id=None):
    # Haal de gekozen film op via de ID
    movie = get_object_or_404(Movie, id=movie_id)

    # Haal de showtime op als showtime_id meegegeven is
    showtime = None
    if showtime_id:
        showtime = get_object_or_404(ShowTime, id=showtime_id)

    zaal = movie.zaal  # Koppel de zaal aan de film
    rows = zaal.rows.all() if zaal else []

    # Haal de eerste 4 films op die niet dezelfde zijn als de gekozen film
    other_movies = Movie.objects.exclude(id=movie_id)[:4]

    # Stuur de film en de andere films naar de template
    return render(request, 'film_detail.html', {
        'movie': movie,
        'other_movies': other_movies,
        'rows': rows,
        'showtime': showtime  # De showtime wordt meegegeven aan de template
    })

def event_detail(request, event_id):
    # Haal de gekozen film op via de ID
    event = get_object_or_404(Event, id=event_id)

    return render(request, 'event_detail.html', {
        'event': event,
    })

@login_required
def update_account_details(request):
    if request.method == "POST":
        action = request.POST.get('action')
        if action == 'update':
            # Verkrijg de nieuwe gegevens van het formulier
            new_geboortedatum = request.POST.get('geboortedatum_update')
            new_voornaam = request.POST.get('voornaam_update')
            new_achternaam = request.POST.get('achternaam_update')
            new_telefoonnummer = request.POST.get('telefoonnummer_update')
            new_postcode = request.POST.get('postcode_update')
            new_email = request.POST.get('email_update')
            new_gender = request.POST.get('gender_update')

            # Verkrijg de gebruiker en het bijbehorende user_profile
            user = request.user
            user_profile = UserProfile.objects.get(user=user)

            # Update de user-gegevens
            user.first_name = new_voornaam
            user.last_name = new_achternaam
            user.email = new_email
            user.save()  # Sla de wijzigingen op in het User-object

            # Update de UserProfile-gegevens
            user_profile.birthday = new_geboortedatum
            user_profile.postcode = new_postcode
            user_profile.phone = new_telefoonnummer
            user_profile.gender = new_gender
            user_profile.save()  # Sla de wijzigingen op in de UserProfile

            return redirect('login_register')  # Stuur de gebruiker terug naar het account-overzicht

        elif action == 'logout':
            logout(request)
            return redirect('/account?login')  # Verwijs naar de inlogpagina na uitloggen

    return redirect('login_register')  # Redirect als de request geen POST is

def login_register_view(request):
    if request.user.is_authenticated:
        user_profile = UserProfile.objects.filter(user=request.user).first()
        tickets = Ticket.objects.filter(user=request.user)
        reserveringen = Reservation.objects.filter(user=request.user)
        watchlist = Watchlist.objects.filter(user=request.user).first()  # Gebruik 'first()' om de eerste (en enige) watchlist op te halen

        return render(request, 'account.html', {
            'is_authenticated': True,
            'user_profile': user_profile,  # Voeg profiel toe aan context
            'tickets': tickets,
            'watchlist': watchlist,
            'reserveringen': reserveringen
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


    # Stuur de tickets en het totale bedrag naar de template
    return render(request, 'winkelmand.html', {
        'tickets': tickets
    })

@login_required
def checkout(request):
    # Als de gebruiker is ingelogd, haal dan de tickets op
    tickets = Ticket.objects.filter(user=request.user) if request.user.is_authenticated else []
    total_price = sum(ticket.price for ticket in tickets)
    # Als de gebruiker niet ingelogd is, kunnen we een variabele toevoegen
    is_authenticated = request.user.is_authenticated

    return render(request, 'checkout.html', {
        'tickets': tickets,
        'is_authenticated': is_authenticated,
        'total_price': total_price,
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

def remove_ticket(request, ticket_id):
    # Haal het ticket op via het ticket ID
    try:
        ticket = Ticket.objects.get(id=ticket_id, user=request.user)  # Veronderstelt dat tickets aan een gebruiker zijn gekoppeld
        ticket.delete()  # Verwijder het ticket
    except Ticket.DoesNotExist:
        # Als het ticket niet bestaat of de gebruiker het niet heeft, geef dan een error weer of redirect naar winkelmand
        return redirect('/winkelmand')  # Stel de juiste URL voor de winkelmand in

    return redirect('/winkelmand')  # Redirect terug naar de winkelmandpagina

def remove_ticket_account(request, ticket_id):
    # Haal het ticket op via het ticket ID
    try:
        ticket = Ticket.objects.get(id=ticket_id, user=request.user)  # Veronderstelt dat tickets aan een gebruiker zijn gekoppeld
        ticket.delete()  # Verwijder het ticket
    except Ticket.DoesNotExist:
        # Als het ticket niet bestaat of de gebruiker het niet heeft, geef dan een error weer of redirect naar winkelmand
        return redirect('/account?login')  # Stel de juiste URL voor de winkelmand in

    return redirect('/account?login')

@login_required
def remove_tickets(request):
    if request.method == 'POST':
        # Verkrijg de ticketgegevens uit de request body
        import json
        data = json.loads(request.body)

        tickets = data.get('tickets', [])
        print(tickets)
        # Maak een reservering voor elke ticket en verwijder het ticket
        for ticket_data in tickets:
            print(ticket_data)
            # Verkrijg het ticket object van de gebruiker
            ticket = Ticket.objects.get(id=ticket_data, user=request.user)

            # Verwijder het ticket
            ticket.delete()

        return JsonResponse({'status': 'success'}, status=200)

    return JsonResponse({'status': 'error'}, status=400)

def remove_reservation(request, ticket_id):
    # Haal het ticket op via het ticket ID
    try:
        reservation = Reservation.objects.get(id=ticket_id, user=request.user)  # Veronderstelt dat tickets aan een gebruiker zijn gekoppeld
        reservation.delete()  # Verwijder het ticket
    except Reservation.DoesNotExist:
        # Als het ticket niet bestaat of de gebruiker het niet heeft, geef dan een error weer of redirect naar winkelmand
        return redirect('/account?login')  # Stel de juiste URL voor de winkelmand in

    return redirect('/account?login')

def remove_reservation_guest(request, ticket_id):
    # Haal het ticket op via het ticket ID
    reservation = Reservation.objects.get(id=ticket_id)  # Veronderstelt dat tickets aan een gebruiker zijn gekoppeld
    reservation.delete()  # Verwijder het ticket

    return HttpResponse(status=204)

def reservation_complete(request, session_id):
    reservations = Reservation.objects.filter(session_id=session_id)
    return render(request, 'reservation_complete.html', {'reservations': reservations})

def guest_reservations(request, session_id):
    reservations = Reservation.objects.filter(session_id=session_id)
    return render(request, 'guest_reservations.html', {'reservations': reservations})

@login_required
def create_event_ticket(request):
    if request.method == 'POST':
        zaal_id = request.POST.get(f'room')
        price = request.POST.get(f'price')
        event_id = request.POST.get(f'event_id')
        # Verkrijg de film en het evenement alleen als ze zijn opgegeven
        event = None
        zaal = None

        if event_id:
            try:
                event = Event.objects.get(id=event_id)
            except Event.DoesNotExist:
                return JsonResponse({'error': 'Evenement niet gevonden'}, status=404)

        if zaal_id:
            try:
                zaal = Zaal.objects.get(id=zaal_id)
            except Zaal.DoesNotExist:
                return JsonResponse({'error': 'Zaal niet gevonden'}, status=404)

        Ticket.objects.create(
            user=request.user,  # De gebruiker die het ticket aanmaakt
            event=event,  # Het evenement (kan None zijn)
            zaal=zaal,  # De zaal
            price=price,  # De prijs van het ticket
            purchased_on=timezone.now()  # Tijdstip van aankoop
        )

        return redirect('/winkelmand')

    return JsonResponse({'error': 'Ongeldige request methode'}, status=405)

def create_event_reservation(request):
    if request.method == 'POST':
        zaal_id = request.POST.get(f'room')
        price = request.POST.get(f'price')
        event_id = request.POST.get(f'event_id')
        # Verkrijg de film en het evenement alleen als ze zijn opgegeven
        event = None
        zaal = None

        session_id = request.session.session_key  # Verkrijg de session_key
        if not session_id:  # Als er geen sessie is, maak een nieuwe sessie
            request.session.create()
            session_id = request.session.session_key

        if event_id:
            try:
                event = Event.objects.get(id=event_id)
            except Event.DoesNotExist:
                return JsonResponse({'error': 'Evenement niet gevonden'}, status=404)

        if zaal_id:
            try:
                zaal = Zaal.objects.get(id=zaal_id)
            except Zaal.DoesNotExist:
                return JsonResponse({'error': 'Zaal niet gevonden'}, status=404)

        if request.user.is_authenticated:
            user = request.user
            guest_name = None
            guest_email = None
        else:
            # Als de gebruiker niet ingelogd is, haal gastgegevens op
            user = None  # Dit is belangrijk voor gastgebruikers
            guest_name = f"{request.POST.get('voornaam')} {request.POST.get('achternaam')}"
            guest_email = request.POST.get('email')

        Reservation.objects.create(
            user=user,  # Als ingelogd, gebruik de ingelogde gebruiker, anders None voor gast
            event=event,
            zaal=zaal,
            price=price,
            session_id=session_id,  # Sla de session_id op voor gasten
            guest_name=guest_name,  # Sla de naam op voor gasten
            guest_email=guest_email,  # Sla het e-mailadres op voor gasten
            reserved_on=timezone.now()
        )

        # Stuur een bevestigingsmail naar de gebruiker of gast
        recipient_email = user.email if user else guest_email

        # Genereer de link voor gastgebruikers
        if not user:
            reservations_url = reverse('guest_reservations', kwargs={'session_id': session_id})
            reservation_link = f"http://127.0.0.1:8000{reservations_url}"

            # Voeg de link toe in de e-mailbody
            email_body = f"""
                Hallo {guest_name},

                Je hebt succesvol een reservering gemaakt voor het event: {event}.

                Je kunt je reserveringen bekijken door de onderstaande link te volgen:
                {reservation_link}

                Bedankt voor je reservering!
            """
        else:
            email_body = f"""
                Hallo {user.get_full_name()},

                Je hebt succesvol een reservering gemaakt voor het event: {event}.

                Bedankt voor je reservering!
            """

        send_mail(
            'Bevestiging van je reservering',
            email_body,
            'from@example.com',  # Gebruik een geldig e-mailadres
            [recipient_email],
            fail_silently=False,
        )

        if request.user.is_authenticated:
            return redirect('/account')
        else:
            return redirect(f'/reservation_complete/{session_id}')

    return JsonResponse({'error': 'Ongeldige request methode'}, status=405)

class CustomPasswordChangeView(PasswordChangeView):
    form_class = CustomPasswordChangeForm
    template_name = 'password_change.html'
    success_url = reverse_lazy('password_change_done')  # Redirect na succesvol wijzigen

class PasswordChangeDoneView(TemplateView):
    template_name = 'password_change_done.html'