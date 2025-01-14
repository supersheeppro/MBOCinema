from django.urls import path
from django.contrib.auth import views as auth_views
from . import views

#URLConf
urlpatterns = [
    path('', views.index, name="index"),
]