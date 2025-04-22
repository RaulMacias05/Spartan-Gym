from django.urls import path
from .views import ventas, registrar_venta

app_name = 'ventas'

urlpatterns = [
    path('', ventas, name='ventas'),
    path('registrar/', registrar_venta, name='registrar_venta')
]
