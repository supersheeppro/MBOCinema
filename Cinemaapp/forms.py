from django import forms
from django.contrib.auth.forms import PasswordChangeForm
from django.contrib.auth.models import User
from django.core.exceptions import ValidationError

class CustomPasswordChangeForm(PasswordChangeForm):
    new_password1 = forms.CharField(
        label="Nieuw wachtwoord",
        widget=forms.PasswordInput(attrs={'class': 'form-control'}),
        strip=False
    )
    new_password2 = forms.CharField(
        label="Herhaal nieuw wachtwoord",
        widget=forms.PasswordInput(attrs={'class': 'form-control'}),
        strip=False
    )

    def clean_new_password2(self):
        # Valideer dat beide wachtwoorden overeenkomen
        new_password1 = self.cleaned_data.get("new_password1")
        new_password2 = self.cleaned_data.get("new_password2")
        if new_password1 and new_password2 and new_password1 != new_password2:
            raise ValidationError("De wachtwoorden komen niet overeen.")
        return new_password2
