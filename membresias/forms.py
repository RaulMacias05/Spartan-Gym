from django import forms
from .models import Membresia
from datetime import date, timedelta
from dateutil.relativedelta import relativedelta  # Necesario para sumar meses

METODOS_PAGO = (
    ('efectivo', 'Efectivo'),
    ('tarjeta', 'Tarjeta'),
)

class MembresiaForm(forms.ModelForm):
    metodo_pago = forms.ChoiceField(choices=METODOS_PAGO, label='Método de Pago')
    monto_pagado = forms.DecimalField(label='Monto Pagado', min_value=0, decimal_places=2)

    class Meta:
        model = Membresia
        fields = ['cliente', 'fecha_inicio', 'fecha_vencimiento']

    def __init__(self, *args, **kwargs):
        super(MembresiaForm, self).__init__(*args, **kwargs)
        
        hoy = date.today()
        proximo_mes = hoy + relativedelta(months=1)
        
        # Asigna fechas por defecto
        self.fields['fecha_inicio'].initial = hoy
        self.fields['fecha_vencimiento'].initial = proximo_mes

        # Desactiva los campos para que no se puedan modificar
        self.fields['fecha_inicio'].widget.attrs['readonly'] = True
        self.fields['fecha_vencimiento'].widget.attrs['readonly'] = True
