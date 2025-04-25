
-- Customers Table
CREATE TABLE Customers (
    customer_id INT PRIMARY KEY,
    name VARCHAR(100),
    email VARCHAR(100),
    state VARCHAR(50),
    created_at DATE
);

INSERT INTO Customers VALUES
(1, 'Aman Kumar', 'aman@example.com', 'Bihar', '2023-01-01'),
(2, 'Sneha Sharma', 'sneha@example.com', 'Delhi', '2023-01-15'),
(3, 'Ravi Yadav', 'ravi@example.com', 'Maharashtra', '2023-02-01');

-- Products Table
CREATE TABLE Products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100),
    category VARCHAR(50),
    price DECIMAL(10,2)
);

INSERT INTO Products VALUES
(101, 'Laptop', 'Electronics', 55000.00),
(102, 'Smartphone', 'Electronics', 22000.00),
(103, 'Shoes', 'Fashion', 2500.00);

-- Orders Table
CREATE TABLE Orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    total_amount DECIMAL(10,2),
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);

INSERT INTO Orders VALUES
(1001, 1, '2023-03-01', 77000.00),
(1002, 2, '2023-03-02', 22000.00),
(1003, 1, '2023-03-05', 2500.00);

-- Order_Items Table
CREATE TABLE Order_Items (
    order_item_id INT PRIMARY KEY,
    order_id INT,
    product_id INT,
    quantity INT,
    FOREIGN KEY (order_id) REFERENCES Orders(order_id),
    FOREIGN KEY (product_id) REFERENCES Products(product_id)
);

INSERT INTO Order_Items VALUES
(1, 1001, 101, 1),
(2, 1001, 102, 1),
(3, 1002, 102, 1),
(4, 1003, 103, 1);
