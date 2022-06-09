import psycopg2
import os
from dotenv import load_dotenv

load_dotenv("../database.env")
print(os.getenv('HOST'))


def get_connection():
    conn = psycopg2.connect(
        host=os.getenv('HOST'),
        database=os.getenv('POSTGRES_DB'),
        user=os.getenv('POSTGRES_USER'),
        password=os.getenv('POSTGRES_PASSWORD'))

    # return a cursor to perform database operations
    return conn.cursor()
