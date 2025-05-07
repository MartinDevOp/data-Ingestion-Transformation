import mysql.connector
import subprocess ##For running commands in python

# MySQL connection details
HOST = "localhost"  # local server
USER = "user_name" #UserName
PASSWORD = "passsword"##UserPass
SQL_FILE1 = "setup/create_databases.sql" #file for empty databases


#Creating the databases
def create_db(HOST, USER, PASSWORD, SQL_FILE1):
# Connect to MySQL server (without specifying a database)
    try:
        conn = mysql.connector.connect(
            host=HOST,
            user=USER,
            password=PASSWORD
        )
        cursor = conn.cursor()

        # Read the database script
        with open(SQL_FILE1, "r") as file:
            for script in file:
                if script !="": ##excludes empty lines if any

                    #Executes the script
                    statement = script
                    cursor.execute(statement)
        print("Databases created successfully!") 
    except mysql.connector.Error as err:
        print(f"Error: {err}")
    finally:
         command = "mysql -u user_name -p password INGESTION < ingestion.sql"
         subprocess.run(command, shell=True)
         conn.close()

create_db(HOST, USER, PASSWORD, SQL_FILE1)
