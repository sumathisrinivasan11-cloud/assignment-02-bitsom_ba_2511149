
CREATE TABLE Customers (
    customer_id   VARCHAR(10) PRIMARY KEY,
    customer_name VARCHAR(100) NOT NULL,
    customer_email VARCHAR(100) NOT NULL,
    customer_city VARCHAR(50) NOT NULL
);

INSERT INTO Customers VALUES
('C001', 'Rohan Mehta', 'rohan@gmail.com', 'Mumbai'),
('C002', 'Priya Sharma', 'priya@gmail.com', 'Delhi'),
('C003', 'Amit Verma', 'amit@gmail.com', 'Bangalore'),
('C004', 'Sneha Iyer', 'sneha@gmail.com', 'Chennai'),
('C005', 'Vikram Singh', 'vikram@gmail.com', 'Mumbai'),
('C006', 'Neha Gupta', 'neha@gmail.com', 'Delhi'),
('C007', 'Arjun Nair', 'arjun@gmail.com', 'Bangalore'),
('C008', 'Kavya Rao', 'kavya@gmail.com', 'Hyderabad');


CREATE TABLE Products (
    product_id    VARCHAR(10) PRIMARY KEY,
    product_name  VARCHAR(100) NOT NULL,
    category      VARCHAR(50) NOT NULL,
    unit_price    DECIMAL(10,2) NOT NULL
);

INSERT INTO Products VALUES
('P001', 'Laptop', 'Electronics', 55000),
('P002', 'Mouse', 'Electronics', 800),
('P003', 'Desk Chair', 'Furniture', 8500),
('P004', 'Notebook', 'Stationery', 120),
('P005', 'Headphones', 'Electronics', 3200),
('P006', 'Standing Desk', 'Furniture', 22000),
('P007', 'Pen Set', 'Stationery', 250),
('P008', 'Webcam', 'Electronics', 2100);


CREATE TABLE SalesReps (
    sales_rep_id   VARCHAR(10) PRIMARY KEY,
    sales_rep_name VARCHAR(100) NOT NULL,
    sales_rep_email VARCHAR(100) NOT NULL,
    office_address VARCHAR(200) NOT NULL
);

INSERT INTO SalesReps VALUES
('SR01', 'Deepak Joshi', 'deepak@corp.com', 'Mumbai HQ, Nariman Point, Mumbai - 400021'),
('SR02', 'Anita Desai', 'anita@corp.com', 'Delhi Office, Connaught Place, New Delhi - 110001'),
('SR03', 'Ravi Kumar', 'ravi@corp.com', 'South Zone, MG Road, Bangalore - 560001');


CREATE TABLE Orders (
    order_id     VARCHAR(10) PRIMARY KEY,
    customer_id  VARCHAR(10) NOT NULL,
    order_date   DATE NOT NULL,
    sales_rep_id VARCHAR(10) NOT NULL,
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id),
    FOREIGN KEY (sales_rep_id) REFERENCES SalesReps(sales_rep_id)
);

INSERT INTO Orders VALUES
('ORD1027', 'C002', '2023-11-02', 'SR02'),
('ORD1114', 'C001', '2023-08-06', 'SR01'),
('ORD1153', 'C006', '2023-02-14', 'SR01'),
('ORD1002', 'C002', '2023-01-17', 'SR02'),
('ORD1118', 'C006', '2023-11-10', 'SR02'),
('ORD1132', 'C003', '2023-03-07', 'SR02'),
('ORD1037', 'C002', '2023-03-06', 'SR03'),
('ORD1075', 'C005', '2023-04-18', 'SR03'),
('ORD1185', 'C003', '2023-06-15', 'SR03');


CREATE TABLE OrderItems (
    order_id   VARCHAR(10) NOT NULL,
    product_id VARCHAR(10) NOT NULL,
    quantity   INT NOT NULL,
    PRIMARY KEY (order_id, product_id),
    FOREIGN KEY (order_id) REFERENCES Orders(order_id),
    FOREIGN KEY (product_id) REFERENCES Products(product_id)
);

INSERT INTO OrderItems VALUES
('ORD1027', 'P004', 4),
('ORD1114', 'P007', 2),
('ORD1153', 'P007', 3),
('ORD1002', 'P005', 1),
('ORD1118', 'P007', 5),
('ORD1132', 'P007', 5),
('ORD1037', 'P007', 2),
('ORD1075', 'P003', 3),
('ORD1185', 'P008', 1);