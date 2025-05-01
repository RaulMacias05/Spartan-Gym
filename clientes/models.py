from django.db import models
from django.db import models

class Clientes(models.Model):
    nombre=models.CharField(max_length=100)
    telefono=models.CharField(max_length=20)
    correo=models.models.EmailField(max_length=254)
    direccion=models.CharField(max_length=200)
    
    def __str__(self):
        return self.nombre
