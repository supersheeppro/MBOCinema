from django.urls import path
from django.contrib.auth import views as auth_views
from . import views

#URLConf
urlpatterns = [
    path('', views.index, name="index"),
    path('search', views.search, name="search"),
    path('add-to-watchlist/<int:movie_id>/', views.add_to_watchlist, name='add_to_watchlist'),
    path('account/', views.login_register_view, name='login_register'),
    path('logout/', auth_views.LogoutView.as_view(), name='logout'),
    path('login/', auth_views.LoginView.as_view(), name='login'),
    path('events/<int:list_id>/', views.event_list_detail, name='event_list_detail'),
    path('film/<int:movie_id>/', views.movie_detail, name='movie_detail'),
    path('event/<int:event_id>/', views.event_detail, name='event_detail'),
    path('winkelmand/', views.winkelmand, name='winkelmand'),
    path('checkout/', views.checkout, name='checkout'),
    path('info', views.info, name='info'),
    path('locations/', views.location_list, name='location_list'),
    path('locations/<int:location_id>/', views.location_detail, name='location_detail'),
]