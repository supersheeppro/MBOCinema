const movieId = document.getElementById('movie_id').value;
const showtimeId = document.getElementById('showtime_id').value;


document.getElementById("stoel-button").addEventListener('click', function() {
    document.getElementById("stoel-button").style.borderColor = "orange";
    document.getElementById("ticket-button").style.borderColor = "blue";
    document.getElementById("gegevens-button").style.borderColor = "blue";
    document.getElementById("afrekenen-button").style.borderColor = "blue";
    document.querySelector(".film-detail-afrekenen-stoelen-container").style.display = "block";
    document.querySelector(".film-detail-afrekenen-tickets-container").style.display = "none";
    document.querySelector(".film-detail-afrekenen-gegevens-container").style.display = "none";
    document.querySelector(".film-detail-afrekenen-afrekenen-container").style.display = "none";
})

document.getElementById("ticket-button").addEventListener('click', function() {
    document.getElementById("stoel-button").style.borderColor = "blue";
    document.getElementById("ticket-button").style.borderColor = "orange";
    document.getElementById("gegevens-button").style.borderColor = "blue";
    document.getElementById("afrekenen-button").style.borderColor = "blue";
    document.querySelector(".film-detail-afrekenen-stoelen-container").style.display = "none";
    document.querySelector(".film-detail-afrekenen-tickets-container").style.display = "block";
    document.querySelector(".film-detail-afrekenen-gegevens-container").style.display = "none";
    document.querySelector(".film-detail-afrekenen-afrekenen-container").style.display = "none";
})

document.getElementById("gegevens-button").addEventListener('click', function() {
    document.getElementById("stoel-button").style.borderColor = "blue";
    document.getElementById("ticket-button").style.borderColor = "blue";
    document.getElementById("gegevens-button").style.borderColor = "orange";
    document.getElementById("afrekenen-button").style.borderColor = "blue";
    document.querySelector(".film-detail-afrekenen-stoelen-container").style.display = "none";
    document.querySelector(".film-detail-afrekenen-tickets-container").style.display = "none";
    document.querySelector(".film-detail-afrekenen-gegevens-container").style.display = "block";
    document.querySelector(".film-detail-afrekenen-afrekenen-container").style.display = "none";
})

document.getElementById("afrekenen-button").addEventListener('click', function() {
    document.getElementById("stoel-button").style.borderColor = "blue";
    document.getElementById("ticket-button").style.borderColor = "blue";
    document.getElementById("gegevens-button").style.borderColor = "blue";
    document.getElementById("afrekenen-button").style.borderColor = "orange";
    document.querySelector(".film-detail-afrekenen-stoelen-container").style.display = "none";
    document.querySelector(".film-detail-afrekenen-tickets-container").style.display = "none";
    document.querySelector(".film-detail-afrekenen-gegevens-container").style.display = "none";
    document.querySelector(".film-detail-afrekenen-afrekenen-container").style.display = "block";
})



// Functie om geselecteerde stoelen op te slaan in localStorage
document.querySelectorAll(".seat-btn").forEach((button) => {
    button.addEventListener("click", function () {
        // Verkrijg de gegevens van de stoel
        const seatId = this.getAttribute("data-seat-id");
        const seatNumber = this.getAttribute("data-seat-number");
        const row = this.getAttribute("data-row");
        const isReserved = this.getAttribute("data-is-reserved") === "True";
        const seatRoom = this.getAttribute("data-seat-room");

        // Als de stoel al gereserveerd is, laat dan een melding zien en stop de actie
        if (isReserved) {
            alert("Deze stoel is al gereserveerd.");
            return;
        }

        // Haal de huidige geselecteerde stoelen uit localStorage
        let selectedSeats = JSON.parse(localStorage.getItem("selectedSeats")) || [];

        // Kijk of de stoel al in de lijst zit
        const existingSeat = selectedSeats.find((seat) => seat.seatId === seatId);

        if (existingSeat) {
            // Verwijder de stoel uit de lijst als deze al geselecteerd is
            selectedSeats = selectedSeats.filter((seat) => seat.seatId !== seatId);
            this.style.borderColor = "green"; // Zet de kleur terug naar groen
        } else {
            // Voeg de stoel toe aan de lijst met de juiste structuur
            selectedSeats.push({
                seatId: seatId,
                seatNumber: seatNumber,
                seatRow: row.split(" ")[1], // Extract de rij uit "Rij 1"
                seatRoom: seatRoom,
                vip: row.includes("VIP"), // Controleer of het VIP is
                type: "", // Standaard leeg
                price: "", // Prijs is nog leeg
            });
            this.style.borderColor = "blue"; // Zet de kleur naar blauw om geselecteerd aan te geven
        }

        // Sla de bijgewerkte lijst op in localStorage
        localStorage.setItem("selectedSeats", JSON.stringify(selectedSeats));

        // Optioneel: log de geselecteerde stoelen
        console.log(selectedSeats);
    });
});

// Bij paginalading: markeer geselecteerde stoelen als blauw
window.onload = function () {
    const selectedSeats = JSON.parse(localStorage.getItem("selectedSeats")) || [];

    selectedSeats.forEach((seat) => {
        const seatButton = document.querySelector(`[data-seat-id='${seat.seatId}']`);
        if (seatButton) {
            seatButton.style.borderColor = "blue"; // Markeer de stoel als geselecteerd
        }
    });
};

document.getElementById("afrekenen-button").addEventListener("click", function () {
    // Haal de stoelen op uit localStorage
    let selectedSeats = JSON.parse(localStorage.getItem("selectedSeats")) || [];
    console.log(selectedSeats)

    // Verkrijg de container waarin de stoelen worden toegevoegd
    const stoelenContainer = document.getElementById("stoelen-container");

    // Wis de container zodat we geen duplicaten krijgen
    stoelenContainer.innerHTML = "";

    // Controleer of er stoelen zijn opgeslagen in localStorage
    if (selectedSeats.length > 0) {
        selectedSeats.forEach((seat) => {
            // Maak een nieuw blokje voor de stoel
            const stoelInfo = document.createElement("ul");
            stoelInfo.classList.add("stoel-info");

            // Voeg de stoel-informatie toe
            stoelInfo.innerHTML = `
                <li>
                    <p>Ticket: <strong>${seat.seatId}</strong></p>
                    <p>Stoelnummer: <strong>${seat.seatNumber}</strong></p>
                    <p>Rij: <strong>${seat.seatRow}</strong></p>
                    <p>Zaal: <strong>${seat.seatRoom}</strong></p>
                    <p>Type: <strong>${seat.type}</strong></p>
                    <p>VIP-status: <strong>${seat.vip ? "Ja" : "Nee"}</strong></p>
                </li>
            `;

            // Voeg de stoel-informatie toe aan de container
            stoelenContainer.appendChild(stoelInfo);
        });
    } else {
        // Als er geen stoelen zijn geselecteerd, toon een bericht
        stoelenContainer.innerHTML = "<p>Er zijn geen geselecteerde stoelen.</p>";
    }
});


// Functie om tickets weer te geven
document.getElementById("ticket-button").addEventListener("click", function () {
    // Haal de stoelen op uit localStorage
    let selectedSeats = JSON.parse(localStorage.getItem("selectedSeats")) || [];

    // Verkrijg de container waarin de tickets worden toegevoegd
    const ticketsContainer = document.getElementById("tickets-container");

    // Wis de container zodat we geen duplicaten krijgen
    ticketsContainer.innerHTML = "";

    // Controleer of er stoelen zijn opgeslagen in localStorage
    if (selectedSeats.length > 0) {
        selectedSeats.forEach((seat) => {
            // Maak een nieuw ticketformulier voor elke stoel
            const ticketForm = document.createElement("ul");
            ticketForm.classList.add("ticket-form");

            // Voeg de stoel informatie toe aan het formulier
            ticketForm.innerHTML = `
                <li>
                    <p>Stoel ${seat.seatNumber}, Rij ${seat.seatRow} (${seat.vip ? "VIP" : "Normaal"}) in zaal ${seat.seatRoom}</p>
                    <label for="ticket-type-${seat.seatId}">Selecteer type ticket:</label>
                    <select id="ticket-type-${seat.seatId}" name="ticket_type_${seat.seatId}" data-seat-id="${seat.seatId}">
                        <option value="" disabled ${!seat.type ? "selected" : ""}>Kies een tickettype</option>
                        <option value="child" ${seat.type === "child" ? "selected" : ""}>Kind (€7.99)</option>
                        <option value="teen" ${seat.type === "teen" ? "selected" : ""}>Tiener (€11.99)</option>
                        <option value="adult" ${seat.type === "adult" ? "selected" : ""}>Volwassene (€16.99)</option>
                    </select>
                    <p>Prijs: €<span id="price-${seat.seatId}">${seat.price || "0.00"}</span></p>
                </li> 
              `;

            // Voeg het ticketformulier toe aan de container
            ticketsContainer.appendChild(ticketForm);

            // Zoek de bijbehorende <select> en voeg een eventlistener toe
            const selectElement = ticketForm.querySelector(`#ticket-type-${seat.seatId}`);
            selectElement.addEventListener("change", function () {
                // Haal het geselecteerde tickettype op
                const selectedType = this.value;
                const seatId = this.getAttribute("data-seat-id");

                // Werk de stoel bij met het geselecteerde type en bijbehorende prijs
                let price = 0;
                if (selectedType === "child") {
                    price = 7.99;
                } else if (selectedType === "teen") {
                    price = 11.99;
                } else if (selectedType === "adult") {
                    price = 16.99;
                }

                // Update de prijs van de stoel in de localStorage
                selectedSeats = selectedSeats.map((s) => {
                    if (s.seatId === seatId) {
                        return { ...s, type: selectedType, price: price }; // Werk het type en prijs bij
                    }
                    return s;
                });

                // Update de weergegeven prijs in het formulier
                document.querySelector(`#price-${seatId}`).innerText = price.toFixed(2);

                // Sla de bijgewerkte stoelen op in localStorage
                localStorage.setItem("selectedSeats", JSON.stringify(selectedSeats));

                // Optioneel: log de bijgewerkte stoelen
                const savedSeats = JSON.parse(localStorage.getItem("selectedSeats"));
                console.log(savedSeats);
            });
        });
    } else {
        // Als er geen geselecteerde stoelen zijn, toon een bericht
        ticketsContainer.innerHTML = "<p>Er zijn geen geselecteerde stoelen.</p>";
    }
});
if (userAuthStatus === true) {
    document.getElementById('submit-ticket').addEventListener('click', function (event) {
        // Haal de gegevens uit localStorage
        const selectedSeats = JSON.parse(localStorage.getItem('selectedSeats')) || [];

        if (selectedSeats.length > 0) {
            // Maak een formulier voor elk geselecteerd ticket
            selectedSeats.forEach((seat, index) => {
                // Maak een verborgen input-element voor elke stoel en voeg het toe aan het formulier
                const ticketTypeInput = document.createElement('input');
                ticketTypeInput.type = 'hidden';
                ticketTypeInput.name = 'type_' + index;
                ticketTypeInput.value = seat.type || "adult"; // Standaard "Standard" als geen type is gekozen
                document.getElementById('ticket-form').appendChild(ticketTypeInput);

                const chairInput = document.createElement('input');
                chairInput.type = 'hidden';
                chairInput.name = 'seat_' + index;
                chairInput.value = seat.seatNumber || "Onbekend"; // Standaard "Onbekend" als geen stoelnummer
                document.getElementById('ticket-form').appendChild(chairInput);

                const seatRowInput = document.createElement('input');
                seatRowInput.type = 'hidden';
                seatRowInput.name = 'seat_row_' + index;
                seatRowInput.value = seat.seatRow || "Onbekend";  // Voeg de rij toe
                document.getElementById('ticket-form').appendChild(seatRowInput);

                const seatRoomInput = document.createElement('input');
                seatRoomInput.type = 'hidden';
                seatRoomInput.name = 'seat_room_' + index;
                seatRoomInput.value = seat.seatRoom || "Onbekend";  // Voeg de zaal toe
                document.getElementById('ticket-form').appendChild(seatRoomInput);

                const vipInput = document.createElement('input');
                vipInput.type = 'hidden';
                vipInput.name = 'vip_' + index;
                vipInput.value = seat.vip ? "True" : "False";  // Voeg VIP-status toe
                document.getElementById('ticket-form').appendChild(vipInput);

                const priceInput = document.createElement('input');
                priceInput.type = 'hidden';
                priceInput.name = 'price_' + index;
                priceInput.value = seat.price || 10.00;  // Standaard prijs als die er niet is
                document.getElementById('ticket-form').appendChild(priceInput);

                // Gebruik de movie_id uit de HTML
                const movieIdInput = document.createElement('input');
                movieIdInput.type = 'hidden';
                movieIdInput.name = 'movie_id_' + index;
                movieIdInput.value = movieId;  // Gebruik hier de movie.id uit de HTML
                document.getElementById('ticket-form').appendChild(movieIdInput);

                const showtimeIdInput = document.createElement('input');
                showtimeIdInput.type = 'hidden';
                showtimeIdInput.name = 'showtime_id_' + index;
                showtimeIdInput.value = showtimeId;  // Gebruik hier de showtime.id uit de HTML
                document.getElementById('ticket-form').appendChild(showtimeIdInput);
            });
            localStorage.removeItem('selectedSeats');
        } else {
            alert("Geen stoel geselecteerd.");
            event.preventDefault();  // Stop het formulier van verzenden
        }
    });
}

document.getElementById('submit-checkout').addEventListener('click', function(event) {
    if (userAuthStatus === false) {
        // Als de gebruiker niet ingelogd is, haal dan de gegevens van de gast op
        const userEmailId = document.getElementById('email').value;
        const userFirstNameId = document.getElementById('first_name').value;
        const userLastNameId = document.getElementById('last_name').value;

        // Voeg de gegevens toe aan het formulier
        var emailInput = document.createElement('input');
        emailInput.type = 'hidden';
        emailInput.name = 'email';
        emailInput.value = userEmailId;
        document.getElementById('checkout-form').appendChild(emailInput);

        var firstNameInput = document.createElement('input');
        firstNameInput.type = 'hidden';
        firstNameInput.name = 'voornaam';
        firstNameInput.value = userFirstNameId;
        document.getElementById('checkout-form').appendChild(firstNameInput);

        var lastNameInput = document.createElement('input');
        lastNameInput.type = 'hidden';
        lastNameInput.name = 'achternaam';
        lastNameInput.value = userLastNameId;
        document.getElementById('checkout-form').appendChild(lastNameInput);
    }

    // Haal de gegevens uit localStorage
    const selectedSeats = JSON.parse(localStorage.getItem('selectedSeats')) || [];
    if (selectedSeats.length > 0) {
        // Maak een formulier voor elk geselecteerd ticket
        selectedSeats.forEach((seat, index) => {
            // Maak een verborgen input-element voor elke stoel en voeg het toe aan het formulier
            const ticketTypeInput = document.createElement('input');
            ticketTypeInput.type = 'hidden';
            ticketTypeInput.name = 'type_' + index;
            ticketTypeInput.value = seat.type || "adult"; // Standaard "Standard" als geen type is gekozen
            document.getElementById('checkout-form').appendChild(ticketTypeInput);

            const chairInput = document.createElement('input');
            chairInput.type = 'hidden';
            chairInput.name = 'seat_' + index;
            chairInput.value = seat.seatNumber || "Onbekend"; // Standaard "Onbekend" als geen stoelnummer
            document.getElementById('checkout-form').appendChild(chairInput);

            const seatRowInput = document.createElement('input');
            seatRowInput.type = 'hidden';
            seatRowInput.name = 'seat_row_' + index;
            seatRowInput.value = seat.seatRow || "Onbekend";  // Voeg de rij toe
            document.getElementById('checkout-form').appendChild(seatRowInput);

            const seatRoomInput = document.createElement('input');
            seatRoomInput.type = 'hidden';
            seatRoomInput.name = 'seat_room_' + index;
            seatRoomInput.value = seat.seatRoom || "Onbekend";  // Voeg de zaal toe
            document.getElementById('checkout-form').appendChild(seatRoomInput);

            const vipInput = document.createElement('input');
            vipInput.type = 'hidden';
            vipInput.name = 'vip_' + index;
            vipInput.value = seat.vip ? "True" : "False";  // Voeg VIP-status toe
            document.getElementById('checkout-form').appendChild(vipInput);

            const priceInput = document.createElement('input');
            priceInput.type = 'hidden';
            priceInput.name = 'price_' + index;
            priceInput.value = seat.price || 10.00;  // Standaard prijs als die er niet is
            document.getElementById('checkout-form').appendChild(priceInput);

            // Gebruik de movie_id uit de HTML
            const movieIdInput = document.createElement('input');
            movieIdInput.type = 'hidden';
            movieIdInput.name = 'movie_id_' + index;
            movieIdInput.value = movieId;  // Gebruik hier de movie.id uit de HTML
            document.getElementById('checkout-form').appendChild(movieIdInput);

            const showtimeIdInput = document.createElement('input');
            showtimeIdInput.type = 'hidden';
            showtimeIdInput.name = 'showtime_id_' + index;
            showtimeIdInput.value = showtimeId;  // Gebruik hier de showtime.id uit de HTML
            document.getElementById('checkout-form').appendChild(showtimeIdInput);
        });
        localStorage.removeItem('selectedSeats');
    } else {
        alert("Geen stoel geselecteerd.");
        event.preventDefault();  // Stop het formulier van verzenden
    }
});

document.querySelectorAll('.payment-option').forEach(option => {
    option.addEventListener('click', function() {
        // Verwijder de 'selected'-klasse van alle opties
        document.querySelectorAll('.payment-option').forEach(opt => opt.classList.remove('selected'));

        // Voeg de 'selected'-klasse toe aan de aangeklikte optie
        this.classList.add('selected');

        // Eventueel: sla de geselecteerde betaalmethode op
        const selectedMethod = this.getAttribute('data-method');
        console.log('Geselecteerde betaalmethode:', selectedMethod);
    });
});

