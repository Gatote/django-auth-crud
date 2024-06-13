#!/bin/bash
set -o errexit

# Instalación de dependencias
pip install -r requirements.txt

# Recolectar archivos estáticos
python manage.py collectstatic --no-input

# Aplicar migraciones de la base de datos
python manage.py migrate
