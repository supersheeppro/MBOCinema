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