from django import forms
from .models import Clientes

class registro_cliente(forms.ModelForm):
    class Meta:
        model=Clientes
        fields=["nombre","telefono","correo","dirreccion"]
        widgets={
            "nombre":forms.TextInput(attrs={"class":"form-control"}),
            "telefono":forms.TextInput(attrs={"class":"form-control"}),
            "correo":forms.EmailField(required=False)(attrs={"class":"form-control"}),
            "direccion":forms.TextInput(attrs={"class":"form-control"})
        }
        
        