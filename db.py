import os
import psycopg2

def get_db_connection():
    db_url = os.environ.get('DATABASE_URL')
    
    if not db_url:
        raise Exception("DATABASE_URL no está configurada en Railway")
    
    try:
        # Conexión directa a PostgreSQL usando la URL de entorno
        conn = psycopg2.connect(db_url)
        return conn
    except Exception as e:
        print(f"Error conectando a PostgreSQL: {e}")
        raise