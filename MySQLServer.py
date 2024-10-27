import mysql.connector
from mysql.connector import Error

def create_database():
    try:
        # Establish a connection to the MySQL server
        connection = mysql.connector.connect(
            host='localhost',
            user='root', 
            password='54Li6363/@' 
        )

        if connection.is_connected():
            cursor = connection.cursor()
            # Create database if it doesn't exist
            cursor.execute("CREATE DATABASE IF NOT EXISTS alx_book_store")
            print("Database 'alx_book_store' created successfully!")

    except Error as e:
        print(f"except mysql.connector.Error: {e}")

    finally:
        # Close the cursor and connection
        if cursor:
            cursor.close()
        if connection.is_connected():
            connection.close()

if __name__ == "__main__":
    create_database()
