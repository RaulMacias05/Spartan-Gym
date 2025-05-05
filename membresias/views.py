from django.shortcuts import render
from .forms import MembresiaForm
from django.shortcuts import render, redirect
from .models import Membresia

# Create your views here.
def membresias(request):
    membresias = Membresia.objects.all()
    return render(request, 'membresias/membresias.html' , {'membresias': membresias})
        

def crear_membresia(request):
    if request.method == 'POST':
        form = MembresiaForm(request.POST)
        if form.is_valid():
            form.save()
            return redirect('membresias:crear_membresia') 
    else:
        form = MembresiaForm()

    return render(request, 'membresias/crear_membresia.html')

def editar_membresia(request, membresia_id):
    if request.method == 'POST':
        # Aquí puedes manejar el formulario para editar la membresía existente
        pass  # Reemplaza esto con tu lógica de edición de membresía

    return render(request, 'membresias/editar_membresia.html', {'membresia_id': membresia_id})

def eliminar_membresia(request, membresia_id):
    if request.method == 'POST':
        # Aquí puedes manejar la lógica para eliminar la membresía
        pass  # Reemplaza esto con tu lógica de eliminación de membresía

    return render(request, 'membresias/eliminar_membresia.html', {'membresia_id': membresia_id})

def activar_membresia(request, membresia_id):
    if request.method == 'POST':
        # Aquí puedes manejar la lógica para activar la membresía
        pass  # Reemplaza esto con tu lógica de activación de membresía

    return render(request, 'membresias/activar_membresia.html', {'membresia_id': membresia_id})

def desactivar_membresia(request, membresia_id):
    if request.method == 'POST':
        # Aquí puedes manejar la lógica para desactivar la membresía
        pass  # Reemplaza esto con tu lógica de desactivación de membresía

    return render(request, 'membresias/desactivar_membresia.html', {'membresia_id': membresia_id})