from django import forms
from .models import Venta

METODO_PAGO_CHOICES = [
    ('', 'Selecciona el método de pago'), 
    ('efectivo', 'Efectivo'), 
    ('tarjeta', 'Tarjeta')
]

class VentaForm(forms.ModelForm):
    
    metodo_pago = forms.ChoiceField(
        choices=METODO_PAGO_CHOICES,
        widget=forms.Select(attrs={'required': True, 'class': 'sale-form'}),
        label='Método de pago'
    )
    
    class Meta:
        model = Venta
        fields = ['metodo_pago', 'monto_pagado']
        widgets = {
            'monto_pagado': forms.NumberInput(attrs={'class': 'form-control', 'step': '0.01'}),
        }
        labels = {
            'monto_pagado': 'Monto pagado',
        }