from django.db import models
from clientes.models import Clientes  # si quieres relacionarlo con un cliente
from datetime import date

class Membresia(models.Model):
    cliente = models.ForeignKey(Clientes, on_delete=models.CASCADE)
    fecha_inicio = models.DateField()
    fecha_vencimiento = models.DateField()
    activa = models.BooleanField(default=True)

    def __str__(self):
        return f"{self.cliente} ({self.fecha_inicio} - {self.fecha_vencimiento})"
    
    def esta_activa(self):
        return self.activa and self.fecha_vencimiento >= date.today()