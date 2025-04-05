from django.db import models
from django.contrib.auth.models import AbstractUser

class Usuario(AbstractUser):
    ROL_CHOICES = [
        ('ADMIN', 'Administrador'),
        ('ENCARGADO', 'Encargado'),
        ('BASICO', 'Básico'),
    ]
    rol = models.CharField(max_length=10, choices=ROL_CHOICES, default='BASICO')

    def __str__(self):
        return f"{self.username} ({self.get_rol_display()})"