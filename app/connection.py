import psycopg2
import os
from dotenv import load_dotenv

load_dotenv("../database.env")
print(os.getenv('POSTGRES_HOST'))


def get_connection():
    conn = psycopg2.connect(
        host=os.getenv('POSTGRES_HOST'),
        database=os.getenv('POSTGRES_DB'),
        user=os.getenv('POSTGRES_USER'),
        password=os.getenv('POSTGRES_PASSWORD'))

    # return a cursor to perform database operations
    return conn.cursor()


def get_all_from_table(tablename:str):
    curs = get_connection()
    curs.execute(f'SELECT * From {tablename}')
    return curs.fetchall()


def run_sql_command_one_result(sql_query:str):
    curs = get_connection()
    curs.execute(sql_query)
    return curs.fetchone()


if __name__ == "__main__":
    get_connection()
