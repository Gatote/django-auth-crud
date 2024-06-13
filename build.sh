#!/bin/bash
set -o errexit

# Instalación de dependencias
pip install -r requirements.txt

# Recolectar archivos estáticos
python manage.py collectstatic --no-input

# Aplicar migraciones de la base de datos
python manage.py migrate

# Ejecutar Gunicorn
gunicorn djangocrud.wsgi --bind 0.0.0.0:$PORT --workers 4 --log-level=info
