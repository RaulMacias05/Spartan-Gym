from django.urls import path
from . import views

app_name = 'ventas'

urlpatterns = [
    path('', views.ventas, name='ventas'),
    path('registrar/', views.registrar_venta, name='registrar_venta')
]
