from django import forms
from .models import Membresia

class MembresiaForm(forms.ModelForm):
    class Meta:
        model = Membresia
        fields = ['cliente', 'fecha_inicio', 'fecha_vencimiento', 'activa']
    