# Generated by Django 5.2 on 2025-05-08 04:27

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('membresias', '0001_initial'),
    ]

    operations = [
        migrations.AddField(
            model_name='membresia',
            name='cambio',
            field=models.DecimalField(blank=True, decimal_places=2, max_digits=10, null=True),
        ),
    ]
