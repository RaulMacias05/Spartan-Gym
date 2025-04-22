from django.urls import path
from .views import reportes, generar_reporte_ventas, generar_reporte_clientes, generar_reporte_productos, generar_reporte_usuarios, generar_reporte_membresias

app_name = 'reportes'

urlpatterns = [
    path('', reportes, name='reportes'),
    path('ventas/', generar_reporte_ventas, name='reporte_ventas'),
    path('clientes/', generar_reporte_clientes, name='reporte_clientes'),
    path('productos/', generar_reporte_productos, name='reporte_productos'),
    path('memorias/', generar_reporte_membresias, name='reporte_membresias'),
    path('usuarios/', generar_reporte_usuarios, name='reporte_usuarios'),
]