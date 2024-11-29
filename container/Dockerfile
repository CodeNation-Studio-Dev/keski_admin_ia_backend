# Imagen base de Python 3.9
FROM python:3.10.11-alpine

# Instala dependencias necesarias
RUN apk add --no-cache \
    gcc \
    musl-dev \
    swig \
    libffi-dev \
    python3-dev \
    && pip install --upgrade pip setuptools

# Directorio de trabajo dentro del contenedor
WORKDIR /app

# Copiar el archivo de requerimientos de Python
COPY requirements.txt .

# Instalar las dependencias de Python
ENV HTTP_PROXY " http://proxy-dmz.intel.com:912"
RUN pip install --upgrade pip --proxy=$HTTP_PROXY
RUN pip install numpy --proxy=$HTTP_PROXY
RUN pip install --no-cache-dir -r requirements.txt --proxy=$HTTP_PROXY

# Copiar el código de la aplicación al contenedor
COPY . .

# Exponer el puerto donde correrá la API o la aplicación
EXPOSE 5000

# Comando para ejecutar la aplicación
CMD ["python", "app.py"]
