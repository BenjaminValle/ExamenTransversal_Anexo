# Usamos la imagen oficial de Python como base
FROM python:3.9-slim

# Establecemos el directorio de trabajo dentro del contenedor
WORKDIR /app

# Copiamos los archivos de requerimientos y los instalamos
COPY requirements.txt requirements.txt
RUN python -m ensurepip && \
    pip install --no-cache-dir -r requirements.txt

# Copiamos el resto de los archivos del proyecto
COPY ./Proyecto1/ .

# Exponemos el puerto que usará la aplicación
EXPOSE 8000

# Comando para correr la aplicación
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]
