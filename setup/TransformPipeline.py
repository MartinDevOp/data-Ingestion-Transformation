

import mysql.connector

def query_task(HOST, USER, PASSWORD,DATABASE,SQL_FILE):
# Connect to MySQL server
    try:
        conn = mysql.connector.connect(
            host=HOST,
            user=USER,
            password=PASSWORD,
            database = DATABASE
        )
        cursor = conn.cursor()

        # Read the database script
        with open(SQL_FILE, "r") as file:
           sql_script = file.read()

        # Execute the SQL script
        for query in sql_script.split(";"):
            if query.strip():  # Avoid executing empty statements
                cursor.execute(query)
        print("query ran successfully!")

    except mysql.connector.Error as err: ##Checks for DB connection errors
        print(f"Error: {err}")
    finally:
        conn.close() ## Close connection
    


# MySQL connection details
HOST = "localhost"  # local server
USER = "MartinREVELIO" ##UserName
PASSWORD = "MartinSQL25" ##UserPass
DATABASE = 'INGESTION' ##DB name
SQL_FILE = "Transform.sql" #Executes transformation task



