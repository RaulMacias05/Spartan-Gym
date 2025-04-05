from django.contrib import admin
from django.contrib.auth.admin import UserAdmin
from .models import Usuario

# Register your models here.

class UsuarioAdmin(UserAdmin):
    fieldsets = UserAdmin.fieldsets + (
        ('Rol', {'fields': ('rol',)}),
    )
    list_display = ('username', 'email', 'rol', 'is_staff', 'is_active')

admin.site.register(Usuario, UsuarioAdmin)
