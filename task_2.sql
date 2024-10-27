-- task_2.sql
USE alx_book_store;
ALTER TABLE Order_Details DROP FOREIGN KEY order_details_ibfk_2;
DROP TABLE books;

CREATE TABLE BOOKS (
    book_id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    author_id INT,
    genre VARCHAR(100),
    price DECIMAL(10, 2),
    publication_date DATE,
    FOREIGN KEY (author_id) REFERENCES AUTHORS(author_id)
);
ALTER TABLE Order_Details DROP FOREIGN KEY order_details_ibfk_2;
DROP TABLE authors;
CREATE TABLE AUTHORS (
    author_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    bio TEXT
);

CREATE TABLE CUSTOMERS (
    customer_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    phone_number VARCHAR(15)
);

CREATE TABLE ORDERS (
    order_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT,
    order_date DATETIME DEFAULT CURRENT_TIMESTAMP,
    total DECIMAL(10, 2),
    FOREIGN KEY (customer_id) REFERENCES CUSTOMERS(customer_id)
);

CREATE TABLE ORDER_DETAILS (
    order_detail_id INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT,
    book_id INT,
    quantity INT,
    price DECIMAL(10, 2),
    FOREIGN KEY (order_id) REFERENCES ORDERS(order_id),
    FOREIGN KEY (book_id) REFERENCES BOOKS(book_id)