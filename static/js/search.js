const saveButtons = document.querySelectorAll('.save-button');

document.getElementById("filters-button").addEventListener('click', function() {
    if (document.getElementById("filters-container").style.display == "") {
        document.getElementById("filters-container").style.display = "flex"
    }
    else {
        document.getElementById("filters-container").style.display = ""
    }
})


function getCsrfToken() {
    const csrfToken = document.cookie.match(/csrftoken=([\w-]+)/);
    return csrfToken ? csrfToken[1] : '';
}



document.addEventListener("DOMContentLoaded", function() {
    // Haal alle hartjes op
    const saveButtons = document.querySelectorAll('.save-button');

    saveButtons.forEach(button => {
        button.addEventListener('click', function(event) {
            event.preventDefault();  // Voorkom de standaard actie (de pagina herladen)
            console.log(document.body.dataset.isAuthenticated)
            if (document.body.dataset.isAuthenticated == "false") {
                alert("Log in om films aan je watchlist toe te voegen.");
                return;
            }

            const icon = this.querySelector('i');  // Het icon in de knop
            const movieId = this.dataset.movieId;  // Haal de movie_id op die gekoppeld is aan de knop

            // Verkrijg de CSRF-token uit de cookies
            const csrfToken = getCsrfToken();

            // Verstuur een AJAX POST-verzoek om de film toe te voegen of te verwijderen
            const isAdded = this.classList.contains('added');
            fetch(`/add-to-watchlist/${movieId}/`, {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json',
                    'X-CSRFToken': csrfToken  // CSRF-token toevoegen vanuit cookies
                },
                body: JSON.stringify({ movie_id: movieId, action: isAdded ? 'remove' : 'add' })
            })
                .then(response => {
                    if (response.ok) {
                        // Actie als het succesvol is
                        this.classList.toggle('added');
                        icon.classList.toggle('active');

                        icon.classList.remove('pop');
                        // Forceer een reflow om de verwijdering van de klasse te registreren
                        void icon.offsetWidth;
                        icon.classList.add('pop');

                    } else {
                        console.log("Er is iets misgegaan.");
                    }
                })
                .catch(error => {
                    console.log("Er is een fout opgetreden:", error);
                });
        });
    });
});

// Verkrijg de huidige datum
var today = new Date();
var year = today.getFullYear();
var month = ('0' + (today.getMonth() + 1)).slice(-2);  // Zorgt voor 2 cijfers bij de maand
var day = ('0' + today.getDate()).slice(-2);  // Zorgt voor 2 cijfers bij de dag
var currentDateString = year + '-' + month + '-' + day;

// Verkrijg de dag van de week (0 is zondag, 1 is maandag, ..., 6 is zaterdag)
var currentDay = today.getDay();  // 0 is zondag, 1 is maandag, ..., 6 is zaterdag

// Maak een array van de dagen van de week
var daysOfWeek = ['Sunday', 'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday'];

// Voeg de datum toe aan de juiste link (behalve voor vandaag)
function updateLink(id, dayOffset) {
    var nextDate = new Date(today);
    nextDate.setDate(today.getDate() + dayOffset);  // Verhoog de dag met dayOffset (bv. 1 voor morgen)
    var year = nextDate.getFullYear();
    var month = ('0' + (nextDate.getMonth() + 1)).slice(-2);
    var day = ('0' + nextDate.getDate()).slice(-2);
    var dateString = year + '-' + month + '-' + day;

    document.getElementById(id).href = '/search?datum=' + dateString;
}

// Update de links voor de dagen van de week
updateLink('today-link', 0);  // Vandaag
updateLink('tomorrow-link', 1);  // Morgen
updateLink('monday-link', (1 - currentDay + 7) % 7);  // Maandag
updateLink('tuesday-link', (2 - currentDay + 7) % 7);  // Dinsdag
updateLink('wednesday-link', (3 - currentDay + 7) % 7);  // Woensdag
updateLink('thursday-link', (4 - currentDay + 7) % 7);  // Donderdag
updateLink('friday-link', (5 - currentDay + 7) % 7);  // Vrijdag
updateLink('saturday-link', (6 - currentDay + 7) % 7);  // Zaterdag
updateLink('sunday-link', (0 - currentDay + 7) % 7);  // Zondag

// Verberg knoppen voor dagen die al voorbij zijn
if (currentDay === 0) { // Sunday
    document.getElementById('monday-link').style.display = 'none';
    document.getElementById('tuesday-link').style.display = 'none';
    document.getElementById('wednesday-link').style.display = 'none';
    document.getElementById('thursday-link').style.display = 'none';
    document.getElementById('friday-link').style.display = 'none';
    document.getElementById('saturday-link').style.display = 'none';
}
if (currentDay === 1) { // Monday
    document.getElementById('monday-link').style.display = 'none';
    document.getElementById('tuesday-link').style.display = 'none';
}
if (currentDay === 2) { // Tuesday
    document.getElementById('monday-link').style.display = 'none';
    document.getElementById('tuesday-link').style.display = 'none';
    document.getElementById('wednesday-link').style.display = 'none';
}
if (currentDay === 3) { // Wednesday
    document.getElementById('monday-link').style.display = 'none';
    document.getElementById('tuesday-link').style.display = 'none';
    document.getElementById('wednesday-link').style.display = 'none';
    document.getElementById('thursday-link').style.display = 'none';
}
if (currentDay === 4) { // Thursday
    document.getElementById('monday-link').style.display = 'none';
    document.getElementById('tuesday-link').style.display = 'none';
    document.getElementById('wednesday-link').style.display = 'none';
    document.getElementById('thursday-link').style.display = 'none';
    document.getElementById('friday-link').style.display = 'none';
}
if (currentDay === 5) { // Friday
    document.getElementById('monday-link').style.display = 'none';
    document.getElementById('tuesday-link').style.display = 'none';
    document.getElementById('wednesday-link').style.display = 'none';
    document.getElementById('thursday-link').style.display = 'none';
    document.getElementById('friday-link').style.display = 'none';
    document.getElementById('saturday-link').style.display = 'none';
}
if (currentDay === 6) { // Saturday
    document.getElementById('monday-link').style.display = 'none';
    document.getElementById('tuesday-link').style.display = 'none';
    document.getElementById('wednesday-link').style.display = 'none';
    document.getElementById('thursday-link').style.display = 'none';
    document.getElementById('friday-link').style.display = 'none';
    document.getElementById('saturday-link').style.display = 'none';
    document.getElementById('sunday-link').style.display = 'none';
}

function searchMovies() {
    var searchInput = document.getElementById('search-input-search').value;
    var currentUrl = window.location.href;  // Huidige URL
    var baseUrl = currentUrl.split('?')[0];  // Basis URL zonder query string
    var params = new URLSearchParams(window.location.search);  // Huidige query parameters

    // Voeg de nieuwe zoekparameter toe (indien aanwezig)
    params.set('name', searchInput);  // Voeg de zoekterm toe aan de query
    // Bouw de nieuwe URL op met de bijgewerkte query parameters
    var newUrl = baseUrl + '?' + params.toString();

    // Verander de URL zonder de pagina opnieuw te laden
    window.history.pushState({ path: newUrl }, '', newUrl);

    // Optioneel: De zoekresultaten laden of de pagina herladen als dat nodig is
    window.location.href = newUrl; // Herlaad de pagina met de nieuwe URL
}

function updateQueryString() {
    // Verkrijg de huidige querystring (indien aanwezig)
    var currentUrl = window.location.href;
    var baseUrl = currentUrl.split('?')[0];  // Basis URL zonder query string
    var params = new URLSearchParams(window.location.search);  // Huidige query parameters

    // Verkrijg de geselecteerde filterwaarden
    var genre = document.getElementById('genre').value;
    var pegi_rating = document.getElementById('pegi_rating').value;
    var rating = document.getElementById('rating').value;
    var zaal = document.getElementById('zaal').value;
    var location = document.getElementById('location').value;

    // Voeg de geselecteerde waarden toe aan de URLSearchParams (en vervang lege waarden met "")
    params.set('genre', genre || "");  // Zet de 'genre' parameter, vervang leeg met ""
    params.set('pegi_rating', pegi_rating || "");  // Zet de 'pegi_rating' parameter, vervang leeg met ""
    params.set('rating', rating || "");  // Zet de 'rating' parameter, vervang leeg met ""
    params.set('zaal', zaal || "");  // Zet de 'zaal' parameter, vervang leeg met ""
    params.set('location', location || "");  // Zet de 'location' parameter, vervang leeg met ""

    // Bouw de nieuwe URL met de bijgewerkte query parameters
    var newUrl = baseUrl + '?' + params.toString();  // Genereer de volledige nieuwe URL

    // Verander de URL zonder de pagina opnieuw te laden
    window.history.pushState({ path: newUrl }, '', newUrl);

    // Optioneel: De pagina herladen met de nieuwe URL (als dat gewenst is)
    window.location.href = newUrl;  // Verzend de nieuwe URL naar de browser
}

// Voeg een eventlistener toe aan de submit knop om de querystring bij te werken
document.getElementById("submit-button-filters").addEventListener('click', function() {
    updateQueryString();     // Update de querystring
});

document.addEventListener("DOMContentLoaded", function() {
    // Verkrijg de queryparameters uit de URL
    var urlParams = new URLSearchParams(window.location.search);

    // Zoekterm instellen
    var searchInput = urlParams.get('name');
    if (searchInput) {
        document.getElementById('search-input-search').value = searchInput;  // Zet de waarde in de zoekbalk
    }

    // Genre instellen
    var genre = urlParams.get('genre');
    if (genre) {
        document.getElementById('genre').value = genre;
    }

    // PEGI Rating instellen
    var pegiRating = urlParams.get('pegi_rating');
    if (pegiRating) {
        document.getElementById('pegi_rating').value = pegiRating;
    }

    // Rating instellen
    var rating = urlParams.get('rating');
    if (rating) {
        document.getElementById('rating').value = rating;
    }

    // Zaal instellen
    var zaal = urlParams.get('zaal');
    if (zaal) {
        document.getElementById('zaal').value = zaal;
    }

    // Locatie instellen
    var location = urlParams.get('location');
    if (location) {
        document.getElementById('location').value = location;
    }
});

function getDateFromUrl() {
    const urlParams = new URLSearchParams(window.location.search);  // Verkrijg de URL-parameters
    const datum = urlParams.get('datum');  // Verkrijg de 'datum' parameter uit de URL
    return datum ? new Date(datum) : null;  // Als datum aanwezig is, retourneer als Date-object, anders null
}

// Functie om de datum van morgen te berekenen
function getTomorrowDate() {
    const today = new Date();
    today.setDate(today.getDate() + 1);
    return today;
}

// Functie om de datum van vandaag te verkrijgen
function getTodayDate() {
    const today = new Date();
    today.setHours(0, 0, 0, 0);  // Zet tijd naar 00:00:00 voor vergelijking
    return today;
}

document.addEventListener("DOMContentLoaded", function() {
    const currentDate = getDateFromUrl();  // Verkrijg de datum uit de URL
    const today = getTodayDate();  // Verkrijg de huidige datum
    const tomorrow = getTomorrowDate();  // Verkrijg de datum van morgen

    // Als er geen datum in de URL staat, gebruik vandaag
    if (!currentDate) {
        document.getElementById('all-link').querySelector('button').style.backgroundColor = 'red';
    }

    const currentDay = currentDate.getDay();  // Verkrijg de dag van de week (0 = zondag, 1 = maandag, etc.)

    // Haal de knoppen op
    var buttons = document.querySelectorAll('a button');

    // Reset de achtergrondkleur van alle knoppen naar standaard
    buttons.forEach(function(button) {
        button.style.backgroundColor = '';  // Verwijder de rode achtergrondkleur
    });

    // Markeer de juiste knop voor de dag van de week
    switch (currentDay) {
        case 0:
            document.getElementById('sunday-link').querySelector('button').style.backgroundColor = 'red';
            break;
        case 1:
            document.getElementById('monday-link').querySelector('button').style.backgroundColor = 'red';
            break;
        case 2:
            document.getElementById('tuesday-link').querySelector('button').style.backgroundColor = 'red';
            break;
        case 3:
            document.getElementById('wednesday-link').querySelector('button').style.backgroundColor = 'red';
            break;
        case 4:
            document.getElementById('thursday-link').querySelector('button').style.backgroundColor = 'red';
            break;
        case 5:
            document.getElementById('friday-link').querySelector('button').style.backgroundColor = 'red';
            break;
        case 6:
            document.getElementById('saturday-link').querySelector('button').style.backgroundColor = 'red';
            break;
    }

    // Markeer de juiste knop voor "Today"
    if (currentDate.toDateString() === today.toDateString()) {
        document.getElementById('today-link').querySelector('button').style.backgroundColor = 'red';
    }

    // Markeer de juiste knop voor "Tomorrow"
    if (currentDate.toDateString() === tomorrow.toDateString()) {
        document.getElementById('tomorrow-link').querySelector('button').style.backgroundColor = 'red';
    }
});