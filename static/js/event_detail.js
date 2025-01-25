document.getElementById("event-detail-bestel-button").addEventListener('click', function() {
    document.querySelector(".payment-and-buttons-container").classList.add("active")
    document.getElementById("event-detail-bestel-button").style.display = "none"
    document.querySelector(".payment-and-buttons-container").addEventListener('transitionend', function handleTransitionEnd(event) {
        if (event.propertyName === "width" || event.propertyName === "height") {
            document.querySelector(".payment-and-buttons-payment-container").style.display = "flex";
            document.getElementById("event-detail-add-to-cart-button").style.display = "block"
            document.getElementById("event-detail-afrekenen-button").style.display = "block"
            document.querySelector(".payment-and-buttons-container").removeEventListener('transitionend', handleTransitionEnd);
        }
    });
})