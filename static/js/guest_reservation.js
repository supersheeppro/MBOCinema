document.addEventListener('DOMContentLoaded', function() {
    const removeButtons = document.querySelectorAll('.remove-button');

    if (removeButtons.length > 0) {
        removeButtons.forEach(function(button) {
            button.addEventListener('click', function(event) {
                const reservationId = button.getAttribute('data-reservation-id');
                const form = document.getElementById('remove-form-' + reservationId);

                // Bevestiging voordat het formulier wordt verzonden
                if (confirm('Weet je zeker dat je deze reservering wilt verwijderen?')) {
                    // Verstuur het formulier via AJAX
                    fetch(form.action, {
                        method: 'POST',
                        body: new FormData(form),
                        headers: {
                            'X-Requested-With': 'XMLHttpRequest', // Dit geeft aan dat het om een AJAX-verzoek gaat
                        }
                    })
                        .then(response => {
                            if (response.ok) {
                                console.log('Reservering succesvol verwijderd');
                                window.location.reload(); // Herlaad de pagina na succesvolle verwijdering
                            } else {
                                console.error('Er is iets mis gegaan met het verwijderen');
                                alert('Er is iets mis gegaan, probeer het opnieuw.');
                            }
                        })
                        .catch(error => {
                            console.error('Er is een fout opgetreden:', error);
                            alert('Er is een fout opgetreden, probeer het opnieuw.');
                        });
                }
            });
        });
    } else {
        console.log("Geen verwijderknoppen gevonden!");
    }
});