document.addEventListener('DOMContentLoaded', function() {
    // Haal de knoppen en formulieren op uit de DOM
    const loginBtn = document.getElementById('login-btn');
    const registerBtn = document.getElementById('register-btn');
    const loginForm = document.getElementById('login-form');
    const registerForm = document.getElementById('register-form');
    const textcontainer = document.querySelector('.account-text-container')
    const formcontainer = document.querySelector('.account-form-content')

    // Controleer de URL voor queryparameters ('register' of 'login')
    const urlParams = new URLSearchParams(window.location.search);

    // Als er een 'register' parameter is in de URL, toon het registratieformulier en pas de styling aan
    if (urlParams.has('register')) {
        registerForm.style.display = 'block'
        registerBtn.style.backgroundColor = "#ff6600"
        loginBtn.style.backgroundColor = "transparent"
        textcontainer.classList.add('moveright') // Verplaats de tekst naar rechts
        loginForm.style.display = 'none'
    }
    // Als er een 'login' parameter is in de URL, toon het inlogformulier en pas de styling aan
    else if (urlParams.has('login')) {
        loginForm.style.display = 'block';
        loginBtn.style.backgroundColor = "#ff6600"
        registerBtn.style.backgroundColor = "transparent"
        textcontainer.classList.remove('moveright') // Verwijder de verschuiving van de tekst
        registerForm.style.display = 'none';
    }

    // Eventlistener voor de login knop: toon het loginformulier, wijzig de styling van de knoppen
    loginBtn.addEventListener('click', function() {
        loginForm.style.display = 'block';
        loginBtn.style.backgroundColor = "#ff6600"
        registerBtn.style.backgroundColor = "transparent"
        textcontainer.classList.remove('moveright') // Verwijder de verschuiving van de tekst
        registerForm.style.display = 'none';
    });

    // Eventlistener voor de registratie knop: toon het registratieformulier, wijzig de styling van de knoppen
    registerBtn.addEventListener('click', function() {
        registerForm.style.display = 'block'
        registerBtn.style.backgroundColor = "#ff6600"
        loginBtn.style.backgroundColor = "transparent"
        textcontainer.classList.add('moveright') // Verplaats de tekst naar rechts
        loginForm.style.display = 'none'
    });
});

// Eventlisteners voor het wisselen tussen verschillende account secties (gegevens, tickets, watchlist, reserveringen)
document.getElementById("account-gegevens-button").addEventListener('click', function() {
    // Toon de accountgegevens, verberg andere secties en wijzig knoppenstijl
    document.getElementById("account-gegevens-container").style.display = "flex";
    document.getElementById("account-gegevens-button").style.backgroundColor = "red";
    document.getElementById("account-tickets-container").style.display = "none";
    document.getElementById("account-tickets-button").style.backgroundColor = "#ff6600";
    document.getElementById("account-watchlist-container").style.display = "none";
    document.getElementById("account-watchlist-button").style.backgroundColor = "#ff6600";
    document.getElementById("account-reserveringen-container").style.display = "none";
    document.getElementById("account-reserveringen-button").style.backgroundColor = "#ff6600";
})

document.getElementById("account-tickets-button").addEventListener('click', function() {
    // Toon de ticketsectie, verberg andere secties en wijzig knoppenstijl
    document.getElementById("account-gegevens-container").style.display = "none";
    document.getElementById("account-gegevens-button").style.backgroundColor = "#ff6600";
    document.getElementById("account-tickets-container").style.display = "flex";
    document.getElementById("account-tickets-button").style.backgroundColor = "red";
    document.getElementById("account-watchlist-container").style.display = "none";
    document.getElementById("account-watchlist-button").style.backgroundColor = "#ff6600";
    document.getElementById("account-reserveringen-container").style.display = "none";
    document.getElementById("account-reserveringen-button").style.backgroundColor = "#ff6600";
})

document.getElementById("account-watchlist-button").addEventListener('click', function() {
    // Toon de watchlist sectie, verberg andere secties en wijzig knoppenstijl
    document.getElementById("account-gegevens-container").style.display = "none";
    document.getElementById("account-gegevens-button").style.backgroundColor = "#ff6600";
    document.getElementById("account-tickets-container").style.display = "none";
    document.getElementById("account-tickets-button").style.backgroundColor = "#ff6600";
    document.getElementById("account-watchlist-container").style.display = "flex";
    document.getElementById("account-watchlist-button").style.backgroundColor = "red";
    document.getElementById("account-reserveringen-container").style.display = "none";
    document.getElementById("account-reserveringen-button").style.backgroundColor = "#ff6600";
})

document.getElementById("account-reserveringen-button").addEventListener('click', function() {
    // Toon de reserveringen sectie, verberg andere secties en wijzig knoppenstijl
    document.getElementById("account-gegevens-container").style.display = "none";
    document.getElementById("account-gegevens-button").style.backgroundColor = "#ff6600";
    document.getElementById("account-tickets-container").style.display = "none";
    document.getElementById("account-tickets-button").style.backgroundColor = "#ff6600";
    document.getElementById("account-watchlist-container").style.display = "none";
    document.getElementById("account-watchlist-button").style.backgroundColor = "#ff6600";
    document.getElementById("account-reserveringen-container").style.display = "flex";
    document.getElementById("account-reserveringen-button").style.backgroundColor = "red";
})
