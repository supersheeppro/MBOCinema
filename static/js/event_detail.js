document.getElementById("event-detail-bestel-button").addEventListener('click', function() {
    document.querySelector(".payment-and-buttons-container").classList.add("active")
    document.getElementById("event-detail-bestel-button").style.display = "none"
    document.querySelector(".payment-and-buttons-container").addEventListener('transitionend', function handleTransitionEnd(event) {
        if (event.propertyName === "width" || event.propertyName === "height") {
            document.querySelector(".payment-and-buttons-payment-container").style.display = "flex";
            document.getElementById("event-submit-ticket").style.display = "block"
            document.querySelector(".payment-and-buttons-container").removeEventListener('transitionend', handleTransitionEnd);
        }
    });
})

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
