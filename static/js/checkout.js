document.addEventListener('DOMContentLoaded', function() {
    const decreaseButtons = document.querySelectorAll('.decrease');
    const increaseButtons = document.querySelectorAll('.increase');
    const totalPriceElement = document.getElementById('total_price');

    function updateTotalPrice() {
        let totalPrice = 0;

        // Loop door elke ticket en update de totale prijs
        document.querySelectorAll('.ticket-quantity').forEach(function(ticketQuantity) {
            const ticketId = ticketQuantity.querySelector('.increase').getAttribute('data-ticket-id');
            const ticketInput = document.getElementById('ticket_quantity_' + ticketId);
            const ticketPrice = parseFloat(document.getElementById('ticket_price_' + ticketId).value);
            const ticketQuantityValue = parseInt(ticketInput.value, 10);

            // Voeg de prijs van dit ticket toe aan de totale prijs
            totalPrice += ticketPrice * ticketQuantityValue;
        });

        // Update de totaalprijs op de pagina
        totalPriceElement.textContent = totalPrice.toFixed(2);
    }

    // Functie om het aantal tickets te verlagen
    decreaseButtons.forEach(function(button) {
        button.addEventListener('click', function() {
            const ticketId = button.getAttribute('data-ticket-id');
            const input = document.getElementById('ticket_quantity_' + ticketId);
            let quantity = parseInt(input.value, 10);
            if (quantity > 1) {
                quantity--;
                input.value = quantity;
            }
            updateTotalPrice(); // Update de totaalprijs
        });
    });

    // Functie om het aantal tickets te verhogen
    increaseButtons.forEach(function(button) {
        button.addEventListener('click', function() {
            const ticketId = button.getAttribute('data-ticket-id');
            const input = document.getElementById('ticket_quantity_' + ticketId);
            let quantity = parseInt(input.value, 10);
            quantity++;
            input.value = quantity;
            updateTotalPrice(); // Update de totaalprijs
        });
    });

    // Initialiseer de totaalprijs bij laden van de pagina
    updateTotalPrice();

    // Afreken-knop actie
    document.getElementById('submit-checkout').addEventListener('click', function(event) {
        event.preventDefault();  // Voorkom dat het formulier direct verzonden wordt

        // Verzamel de ticketgegevens van de HTML
        const ticketIds = []; // Voor alleen de ticket.id's
        const ticketData = [];
        let index = 0;
        document.querySelectorAll('.ticket-quantity').forEach((ticketQuantityElement) => {
            const ticketId = ticketQuantityElement.querySelector('.increase').getAttribute('data-ticket-id');
            const ticketInput = document.getElementById('ticket_quantity_' + ticketId);
            const ticketPrice = parseFloat(document.getElementById('ticket_price_' + ticketId).value);
            const ticketQuantityValue = parseInt(ticketInput.value, 10);

            for (let i = 0; i < ticketQuantityValue; i++) {
                ticketIds.push(ticketId); // Alleen het ID toevoegen
            }

            // Haal de gegevens van het ticket op uit de HTML
            const ticket = {
                seat: ticketQuantityElement.closest('li').querySelector('.ticket-seat-number').textContent || null,
                seat_row: ticketQuantityElement.closest('li').querySelector('.ticket-seat-row').textContent || null,
                seat_room: ticketQuantityElement.closest('li').querySelector('.ticket-seat-room').textContent || null,
                vip: ticketQuantityElement.closest('li').querySelector('.ticket-vip').textContent === "True",
                price: ticketPrice,
                quantity: ticketQuantityValue,
                movie_id: ticketQuantityElement.closest('li').querySelector('.ticket-movie-id').textContent || null,
                event_id: ticketQuantityElement.closest('li').querySelector('.ticket-event-id').textContent || null,
                showtime_id: ticketQuantityElement.closest('li').querySelector('.ticket-showtime-id').textContent || null
            };

            // Voeg het ticket meerdere keren toe op basis van de hoeveelheid
            for (let i = 0; i < ticketQuantityValue; i++) {
                ticketData.push({...ticket});  // Voeg het ticket toe aan de array
            }
            index++; // Verhoog index voor het volgende ticket
        });
        fetch('/remove_tickets/', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json',
                'X-CSRFToken': document.querySelector('[name=csrfmiddlewaretoken]').value  // Zorg ervoor dat CSRF-token wordt meegestuurd
            },
            body: JSON.stringify({ tickets: ticketIds })  // Stuur de ticketgegevens naar de server
        })
            .then(response => {
                if (response.ok) {
                    // Als het verzoek succesvol is, submit dan het formulier
                    const form = document.getElementById('checkout-form');
                    form.submit();  // Formulier verzenden naar de server
                } else {
                    console.error('Fout bij het verwerken van het verzoek');
                }
            })
            .catch(error => {
                console.error('Er is een fout opgetreden:', error);
            });

        // Nu gaan we door de ticketData array en voegen elk ticket toe aan het formulier
        ticketData.forEach((ticket, index) => {
            const form = document.getElementById('checkout-form');

            // Voeg verborgen invoervelden toe aan het formulier voor elk ticket
            const ticketTypeInput = document.createElement('input');
            ticketTypeInput.type = 'hidden';
            ticketTypeInput.name = 'type_' + index;
            ticketTypeInput.value = ticket.type || "adult";  // Standaard "adult" als geen type is gekozen
            form.appendChild(ticketTypeInput);

            const chairInput = document.createElement('input');
            chairInput.type = 'hidden';
            chairInput.name = 'seat_' + index;
            chairInput.value = ticket.seat || "Onbekend";
            form.appendChild(chairInput);

            const seatRowInput = document.createElement('input');
            seatRowInput.type = 'hidden';
            seatRowInput.name = 'seat_row_' + index;
            seatRowInput.value = ticket.seat_row || "Onbekend";
            form.appendChild(seatRowInput);

            const seatRoomInput = document.createElement('input');
            seatRoomInput.type = 'hidden';
            seatRoomInput.name = 'seat_room_' + index;
            seatRoomInput.value = ticket.seat_room || "Onbekend";
            form.appendChild(seatRoomInput);

            const vipInput = document.createElement('input');
            vipInput.type = 'hidden';
            vipInput.name = 'vip_' + index;
            vipInput.value = ticket.vip ? "True" : "False";  // Voeg VIP-status toe
            form.appendChild(vipInput);

            const priceInput = document.createElement('input');
            priceInput.type = 'hidden';
            priceInput.name = 'price_' + index;
            priceInput.value = ticket.price || 10.00;  // Standaard prijs als die er niet is
            form.appendChild(priceInput);

            const movieIdInput = document.createElement('input');
            movieIdInput.type = 'hidden';
            movieIdInput.name = 'movie_id_' + index;
            movieIdInput.value = ticket.movie_id;  // Gebruik de movie_id uit de HTML
            form.appendChild(movieIdInput);

            const eventIdInput = document.createElement('input');
            eventIdInput.type = 'hidden';
            eventIdInput.name = 'event_id_' + index;
            eventIdInput.value = ticket.event_id;  // Gebruik de movie_id uit de HTML
            form.appendChild(eventIdInput);

            const showtimeIdInput = document.createElement('input');
            showtimeIdInput.type = 'hidden';
            showtimeIdInput.name = 'showtime_id_' + index;
            showtimeIdInput.value = ticket.showtime_id;  // Gebruik de showtime_id uit de HTML
            form.appendChild(showtimeIdInput);
            console.log(ticket)
        });

    });
});
