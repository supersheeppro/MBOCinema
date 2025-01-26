from django.contrib.sitemaps import Sitemap
from django.urls import reverse

class StaticViewSitemap(Sitemap):
    changefreq = "daily"
    priority = 0.8

    def items(self):
        return [
            'index',
            'search',
            'login_register',
            'logout',
            'login',
            'winkelmand',
            'checkout',
            'info',
            'location_list',
            'password_change',
            'password_reset',
        ]

    def location(self, item):
        return reverse(item)
