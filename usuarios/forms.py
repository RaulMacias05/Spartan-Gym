from django import forms
from django.contrib.auth.forms import UserCreationForm
from .models import Usuario

class RegistroUsuarioForm(UserCreationForm):
    class Meta:
        model = Usuario
        fields = ['username', 'email', 'rol', 'telefono', 'direccion', 'dni', 'password1', 'password2']
        widgets = {
            'rol': forms.Select(attrs={'class': 'form-select'}),
        }

    def clean_dni(self):
        dni = self.cleaned_data.get('dni')
        if Usuario.objects.filter(dni=dni).exists():
            raise forms.ValidationError("Ya existe un usuario con ese DNI.")
        return dni
