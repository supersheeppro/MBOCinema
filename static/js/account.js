document.addEventListener('DOMContentLoaded', function() {
    const loginBtn = document.getElementById('login-btn');
    const registerBtn = document.getElementById('register-btn');
    const loginForm = document.getElementById('login-form');
    const registerForm = document.getElementById('register-form');
    const textcontainer = document.querySelector('.account-text-container')
    const formcontainer = document.querySelector('.account-form-content')

    // Controleer de URL voor queryparameters
    const urlParams = new URLSearchParams(window.location.search);
    if (urlParams.has('register')) {
        registerForm.style.display = 'block'
        registerBtn.style.backgroundColor = "#ff6600"
        loginBtn.style.backgroundColor = "transparent"
        textcontainer.classList.add('moveright')
        loginForm.style.display = 'none'
    } else if (urlParams.has('login')) {
        loginForm.style.display = 'block';
        loginBtn.style.backgroundColor = "#ff6600"
        registerBtn.style.backgroundColor = "transparent"
        textcontainer.classList.remove('moveright')
        registerForm.style.display = 'none';
    }

    loginBtn.addEventListener('click', function() {
        loginForm.style.display = 'block';
        loginBtn.style.backgroundColor = "#ff6600"
        registerBtn.style.backgroundColor = "transparent"
        textcontainer.classList.remove('moveright')
        registerForm.style.display = 'none';
    });

    registerBtn.addEventListener('click', function() {
        registerForm.style.display = 'block'
        registerBtn.style.backgroundColor = "#ff6600"
        loginBtn.style.backgroundColor = "transparent"
        textcontainer.classList.add('moveright')
        loginForm.style.display = 'none'
    });
});

document.getElementById("account-gegevens-button").addEventListener('click', function() {
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
    document.getElementById("account-gegevens-container").style.display = "none";
    document.getElementById("account-gegevens-button").style.backgroundColor = "#ff6600";
    document.getElementById("account-tickets-container").style.display = "none";
    document.getElementById("account-tickets-button").style.backgroundColor = "#ff6600";
    document.getElementById("account-watchlist-container").style.display = "none";
    document.getElementById("account-watchlist-button").style.backgroundColor = "#ff6600";
    document.getElementById("account-reserveringen-container").style.display = "flex";
    document.getElementById("account-reserveringen-button").style.backgroundColor = "red";
})