from django.shortcuts import render
from .forms import registro_cliente
from .models import Clientes

# Create your views here.
def clientes(request):
    return render(request, 'clientes/clientes.html')

def crear_cliente(request):
    if request.method == 'POST':
        
    elif request.method == 'GET':
        form=registro_cliente


    return render(request, 'clientes/crear_cliente.html',{"form":form})

def editar_cliente(request, cliente_id):
    if request.method == 'POST':
        # Aquí puedes manejar el formulario para editar el cliente existente
        pass  # Reemplaza esto con tu lógica de edición de cliente

    return render(request, 'clientes/editar_cliente.html', {'cliente_id': cliente_id})

def eliminar_cliente(request, cliente_id):
    if request.method == 'POST':
        # Aquí puedes manejar la lógica para eliminar el cliente
        pass  # Reemplaza esto con tu lógica de eliminación de cliente

    return render(request, 'clientes/eliminar_cliente.html', {'cliente_id': cliente_id})