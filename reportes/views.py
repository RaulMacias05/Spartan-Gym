from django.shortcuts import render

# Create your views here.
def reportes(request):
    return render(request, 'reportes/reportes.html')

def generar_reporte_ventas(request):
    # Aquí puedes manejar la lógica para generar el reporte
    # Por ejemplo, obtener datos de la base de datos y pasarlos al template
    return render(request, 'reportes/generar_reporte.html')

def generar_reporte_clientes(request):
    # Aquí puedes manejar la lógica para generar el reporte de clientes
    return render(request, 'reportes/generar_reporte_clientes.html')

def generar_reporte_productos(request):
    # Aquí puedes manejar la lógica para generar el reporte de productos
    return render(request, 'reportes/generar_reporte_productos.html')

def generar_reporte_membresias(request):
    # Aquí puedes manejar la lógica para generar el reporte de membresías
    return render(request, 'reportes/generar_reporte_membresias.html')

def generar_reporte_usuarios(request):
    # Aquí puedes manejar la lógica para generar el reporte de usuarios
    return render(request, 'reportes/generar_reporte_usuarios.html')