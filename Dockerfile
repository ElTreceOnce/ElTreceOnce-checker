FROM python:3.11-slim

WORKDIR /app

# Instalar dependencias de sistema (curl es necesario para verificaciones)
RUN apt-get update && apt-get install -y curl && rm -rf /var/lib/apt/lists/*

# Copiar dependencias de Python desde la RAÍZ
COPY requirements.txt ./requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

# Copiar los scripts de Python desde la RAÍZ
COPY checker.py ./checker.py
COPY db.py ./db.py

# Copiar el script de ejecución desde la RAÍZ
COPY run.sh ./run.sh

# Dar permisos de ejecución al script run.sh
RUN chmod +x run.sh

# Comando para iniciar el script
CMD ["sh", "run.sh"]