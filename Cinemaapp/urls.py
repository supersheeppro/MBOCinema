from django.urls import path
from django.contrib.auth import views as auth_views
from . import views
from .views import PasswordChangeDoneView, CustomPasswordChangeView
from django.contrib.auth.decorators import login_required
from django.contrib import sitemaps
from django.contrib.sitemaps.views import sitemap
from Cinemaapp.sitemaps import StaticViewSitemap

sitemaps = {
    'static': StaticViewSitemap,
}

#URLConf
urlpatterns = [
    path('', views.index, name="index"),
    path('search', views.search, name="search"),
    path('add-to-watchlist/<int:movie_id>/', views.add_to_watchlist, name='add_to_watchlist'),
    path('account/', views.login_register_view, name='login_register'),
    path('logout/', auth_views.LogoutView.as_view(), name='logout'),
    path('login/', auth_views.LoginView.as_view(), name='login'),
    path('events/<int:list_id>/', views.event_list_detail, name='event_list_detail'),
    path('film/<int:movie_id>/showtime/<int:showtime_id>/', views.movie_detail, name='movie_detail'),
    path('event/<int:event_id>/', views.event_detail, name='event_detail'),
    path('winkelmand/', views.winkelmand, name='winkelmand'),
    path('checkout/', views.checkout, name='checkout'),
    path('info', views.info, name='info'),
    path('locations/', views.location_list, name='location_list'),
    path('locations/<int:location_id>/', views.location_detail, name='location_detail'),
    path('update_account_details/', views.update_account_details, name='update_account_details'),
    path('remove_ticket/<int:ticket_id>/', views.remove_ticket, name='remove_ticket'),
    path('remove_ticket_account/<int:ticket_id>/', views.remove_ticket_account, name='remove_ticket_account'),
    path('verander-wachtwoord/', login_required(CustomPasswordChangeView.as_view()), name='password_change'),
    path('verander-wachtwoord-klaar/', PasswordChangeDoneView.as_view(), name='password_change_done'),
    path('reset-password/', auth_views.PasswordResetView.as_view(template_name='password_reset.html'), name='password_reset'),
    path('reset-password-done/', auth_views.PasswordResetDoneView.as_view(template_name='password_reset_done.html'), name='password_reset_done'),
    path('reset/<uidb64>/<token>/', auth_views.PasswordResetConfirmView.as_view(template_name='password_reset_confirm.html'), name='password_reset_confirm'),
    path('reset-password-complete/', auth_views.PasswordResetCompleteView.as_view(template_name='password_reset_complete.html'), name='password_reset_complete'),
    path('remove_reservation/<int:ticket_id>/', views.remove_reservation, name='remove_reservation'),
    path('remove-from-watchlist/<int:movie_id>/', views.remove_from_watchlist, name='remove_from_watchlist'),
    path('create-ticket/', views.create_ticket, name='create_ticket'),
    path('create_reservation/', views.create_reservation, name='create_reservation'),
    path('reservation_complete/<str:session_id>/', views.reservation_complete, name="reservation_complete"),
    path('guest_reservations/<str:session_id>/', views.guest_reservations, name="guest_reservations"),
    path('remove_reservation_guest/<int:ticket_id>/', views.remove_reservation_guest, name='remove_reservation_guest'),
    path('remove_tickets/', views.remove_tickets, name='remove_tickets'),
    path('create_event_ticket/', views.create_event_ticket, name='create_event_ticket'),
    path('create_event_reservation/', views.create_event_reservation, name='create_event_reservation'),
    path('sitemap.xml', sitemap, {'sitemaps': sitemaps}, name='django.contrib.sitemaps.views.sitemap'),
]