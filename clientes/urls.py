from django.urls import path
from .views import clientes, crear_cliente, editar_cliente, eliminar_cliente

app_name = 'clientes'

urlpatterns = [
    path('', clientes, name='clientes'),
    path('crear/', crear_cliente, name='crear_cliente'),
    path('editar/<int:cliente_id>/', editar_cliente, name='editar_cliente'),
    path('eliminar/<int:cliente_id>/', eliminar_cliente, name='eliminar_cliente'),
]