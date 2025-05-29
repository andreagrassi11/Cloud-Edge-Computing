FROM python:3.11-slim

# Evita file .pyc e output bufferizzato
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

# Cartella di lavoro
WORKDIR /app

# Installa pipenv
RUN pip install --no-cache-dir pipenv

# Copia solo i file di dipendenze
COPY Pipfile Pipfile.lock ./

# Installa le dipendenze a livello di sistema
RUN pipenv install --system --deploy

# Copia il codice Django (cartella interna)
COPY Quickshare_backend/ .

# Espone la porta 8000
EXPOSE 8000

# Comando di avvio
CMD ["sh", "-c", "python manage.py migrate && gunicorn quickshare.wsgi:application --bind 0.0.0.0:8000"]

