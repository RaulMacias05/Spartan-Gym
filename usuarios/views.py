from django.shortcuts import render, redirect
from .forms import RegistroUsuarioForm
from django.shortcuts import redirect
from django.contrib.auth import get_user_model

def lista_usuarios(request):
    Usuario = get_user_model()
    usuarios = Usuario.objects.all()
    return render(request, 'usuarios/lista_usuarios.html', {'usuarios': usuarios})

def redireccion_inicio(request):
    return redirect('usuarios:registrar_usuario')

def registrar_usuario(request):
    if request.method == 'POST':
        form = RegistroUsuarioForm(request.POST)
        if form.is_valid():
            form.save()
            return redirect('usuarios:lista_usuarios')  # o donde desees redirigir
    else:
        form = RegistroUsuarioForm()
    return render(request, 'usuarios/registro.html', {'form': form})