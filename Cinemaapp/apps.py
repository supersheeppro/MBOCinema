from django.apps import AppConfig


class CinemaappConfig(AppConfig):
    default_auto_field = 'django.db.models.BigAutoField'
    name = 'Cinemaapp'

    def ready(self):
        import Cinemaapp.signals