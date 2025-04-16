from django.urls import path
from . import views

app_name = 'core'

urlpatterns = [
    path('', views.signin, name='signin'),
    path('inicio/', views.inicio, name='inicio'),   
]