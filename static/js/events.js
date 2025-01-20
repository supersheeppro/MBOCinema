document.getElementById("filters-button").addEventListener('click', function() {
    if (document.getElementById("filters-container").style.display == "") {
        document.getElementById("filters-container").style.display = "flex"
    }
    else {
        document.getElementById("filters-container").style.display = ""
    }
})


function searchEvents() {
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
    // Voeg de geselecteerde waarden toe aan de URLSearchParams (en vervang lege waarden met "")
    params.set('genre', genre || "");  // Zet de 'genre' parameter, vervang leeg met ""
    params.set('pegi_rating', pegi_rating || "");  // Zet de 'pegi_rating' parameter, vervang leeg met ""
    params.set('rating', rating || "");  // Zet de 'rating' parameter, vervang leeg met ""
    params.set('zaal', zaal || "");  // Zet de 'zaal' parameter, vervang leeg met ""

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
});

