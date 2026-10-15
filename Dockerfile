FROM python:3.11-slim

# Establecer la carpeta de trabajo
WORKDIR /app

# Instalar dependencias de sistema
RUN apt-get update && apt-get install -y curl && rm -rf /var/lib/apt/lists/*

# Copiar dependencias Python
COPY requirements.txt ./requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

# Copiar archivos Python
COPY checker.py ./checker.py
COPY db.py ./db.py

# --- COMANDO DIRECTO ---
# Ejecutar python3 directamente sin script intermedio
CMD ["python3", "checker.py"]