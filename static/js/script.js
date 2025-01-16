var swiper = new Swiper('#hero-slideshow', {
    slidesPerView: 1,
    spaceBetween: 0,
    loop: true,
    autoplay: {
        delay: 2500,
        disableOnInteraction: false
    },
    speed: 1000,
});

const eventsContainer = document.querySelector('.events-container'); // Zorg ervoor dat de class hier correct is

// Variabelen voor muispositie
let isMouseDown = false;
let startX, scrollLeft;

// Wanneer je de muis indrukt
eventsContainer.addEventListener('mousedown', (e) => {
    isMouseDown = true;
    startX = e.pageX - eventsContainer.offsetLeft;  // Waar je klikt ten opzichte van de container
    scrollLeft = eventsContainer.scrollLeft;         // Huidige scrollpositie
    eventsContainer.style.cursor = 'grabbing';        // Verander de cursor naar 'grabbing' (hand vasthouden)
});

// Wanneer je de muis loslaat
eventsContainer.addEventListener('mouseup', () => {
    isMouseDown = false;
    eventsContainer.style.cursor = 'grab';  // Terug naar de normale handcursor
});

// Wanneer je de muis beweegt met ingedrukte knop
eventsContainer.addEventListener('mousemove', (e) => {
    if (!isMouseDown) return;  // Alleen als de muisknop ingedrukt is
    e.preventDefault();  // Voorkom dat de container zelf automatisch scrolt
    const x = e.pageX - eventsContainer.offsetLeft;  // Bepaal de nieuwe muispositie
    const walk = (x - startX) * 2;  // Beweging factor (verhoogt snelheid, kan worden aangepast)
    eventsContainer.scrollLeft = scrollLeft - walk;  // Verplaats de container op basis van de muisbeweging
});
