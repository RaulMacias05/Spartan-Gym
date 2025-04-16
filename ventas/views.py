from django.shortcuts import render

# Create your views here.
def ventas(request):
    return render(request, 'ventas/ventas.html')

def registrar_venta(request):
    return render(request, 'ventas/registrar_venta.html')