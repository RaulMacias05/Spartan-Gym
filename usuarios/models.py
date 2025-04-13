from django.contrib.auth.models import AbstractUser
from django.db import models

class Usuario(AbstractUser):
    ROL_CHOICES = [
        ('ADMIN', 'Administrador'),
        ('ENCARGADO', 'Encargado'),
        ('BASICO', 'Básico'),
    ]

    rol = models.CharField(max_length=10, choices=ROL_CHOICES, default='BASICO')
    telefono = models.CharField(max_length=20, blank=True)
    direccion = models.CharField(max_length=255, blank=True)
    dni = models.CharField(max_length=20, unique=True, blank=False, null=False)

    def __str__(self):
        return f"{self.username} ({self.get_rol_display()})"
