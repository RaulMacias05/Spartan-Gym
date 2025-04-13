from django.urls import path
from . import views

app_name = 'usuarios'

urlpatterns = [
    path('registrar/', views.registrar_usuario, name='registrar_usuario'),
    path('lista/', views.lista_usuarios, name='lista_usuarios'),  # ← aquí la nueva ruta
]
