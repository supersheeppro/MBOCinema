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
});