from pathlib import Path
import os



BASE_DIR = Path(__file__).resolve().parent.parent
# Logging configuratie
LOGGING = {
    'version': 1,
    'disable_existing_loggers': False,
    'handlers': {
        'file': {
            'level': 'INFO',
            'class': 'logging.FileHandler',
            'filename': os.path.join(BASE_DIR, 'django.log'),
        },
    },
    'loggers': {
        'django': {
            'handlers': ['file'],
            'level': 'INFO',
            'propagate': True,
        },
    },
}
SECRET_KEY = 'django-insecure-n74-227!_r5%!vec9^(!-)m@xz7k02^uvq)(7)&ume%%z#o2^7'

DEBUG = True

ALLOWED_HOSTS = []

INSTALLED_APPS = [
    'Cinemaapp',
    'django.contrib.admin',
    'django.contrib.auth',
    'django.contrib.contenttypes',
    'django.contrib.sessions',
    'django.contrib.messages',
    'django.contrib.staticfiles',
    'django.contrib.sitemaps',
]

MIDDLEWARE = [
    'django.middleware.security.SecurityMiddleware',
    'django.contrib.sessions.middleware.SessionMiddleware',
    'django.middleware.common.CommonMiddleware',
    'django.middleware.csrf.CsrfViewMiddleware',
    'django.contrib.auth.middleware.AuthenticationMiddleware',
    'django.contrib.messages.middleware.MessageMiddleware',
    'django.middleware.clickjacking.XFrameOptionsMiddleware',
]

ROOT_URLCONF = 'Cinema.urls'

TEMPLATES = [
    {
        'BACKEND': 'django.template.backends.django.DjangoTemplates',
        'DIRS': [BASE_DIR / "templates"],  # Voeg dit toe voor template-mappen
        'APP_DIRS': True,
        'OPTIONS': {
            'context_processors': [
                'django.template.context_processors.debug',
                'django.template.context_processors.request',
                'django.contrib.auth.context_processors.auth',
                'django.contrib.messages.context_processors.messages',
                'Cinemaapp.context_processors.event_lists',
            ],
        },
    },
]

WSGI_APPLICATION = 'Cinema.wsgi.application'

DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.mysql',
        'NAME': 'mbo_cinema',
        'USER': 'root',
        'PASSWORD': 'D@vi7596',
        'HOST': 'localhost',  # of een andere host als je database extern staat
        'PORT': '3306',  # of een andere poort als je MySQL op een andere poort draait
    },
}


AUTH_PASSWORD_VALIDATORS = [
    {
        'NAME': 'django.contrib.auth.password_validation.UserAttributeSimilarityValidator',
    },
    {
        'NAME': 'django.contrib.auth.password_validation.MinimumLengthValidator',
    },
    {
        'NAME': 'django.contrib.auth.password_validation.CommonPasswordValidator',
    },
    {
        'NAME': 'django.contrib.auth.password_validation.NumericPasswordValidator',
    },
]

LANGUAGE_CODE = 'en-us'

TIME_ZONE = 'UTC'

USE_I18N = True

USE_L10N = True  # Voeg dit toe voor lokale formaten

USE_TZ = True

STATIC_URL = '/static/'  # Verander de STATIC_URL-configuratie

STATICFILES_DIRS = [
    BASE_DIR / "static",  # Voeg dit toe voor extra statische bestanden
]

STATIC_ROOT = BASE_DIR / "staticfiles"  # Voeg dit toe voor productie

DEFAULT_AUTO_FIELD = 'django.db.models.BigAutoField'

LOGIN_URL = '/account?login'

LOGIN_REDIRECT_URL = '/account'
LOGOUT_REDIRECT_URL = '/account?login'

MEDIA_URL = '/media/'
MEDIA_ROOT = os.path.join(BASE_DIR, 'media')
EMAIL_BACKEND = 'django.core.mail.backends.console.EmailBackend'