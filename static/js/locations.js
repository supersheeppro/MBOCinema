// AJAX functie om locatiegegevens te laden
$(document).ready(function(){
    $('.location-item').on('click', function() {
        var locationId = $(this).data('id');  // Verkrijg het ID van de geselecteerde locatie

        // Voer een AJAX-aanroep uit naar de server om locatiegegevens op te halen
        $.ajax({
            url: '/locations/' + locationId + '/',
            method: 'GET',
            success: function(data) {
                // Werk de linkerkolom bij met de gegevens van de locatie
                $('#location-detail').html(
                    '<div class="location-detail-content-container">' +
                    '<div>' +
                    '<h1>' + data.name + '</h1>' +
                    '<p class="location-detail-content-address-text">' + data.address + '</p>' +
                    '</div>' +
                    '<p class="location-detail-content-text">' + data.description + '</p>' +
                    '</div>' +
                    '<div class="location-image-button-container">' +
                    (data.photo_url ? '<img src="' + data.photo_url + '" alt="Foto" style="max-width: 100%; height: auto;">' : '') +
                    '<a href="/search?location=' + data.name + '"><button>Zie Films</button></a>' +
                    '</div>'

                );
            }
        });
    });
});