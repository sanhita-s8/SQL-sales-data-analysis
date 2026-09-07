USE ecommerce_sales;

-- Customers
INSERT INTO customers VALUES
(1, 'Aarav Sharma', 'aarav@gmail.com', 'Mumbai', '2024-01-15'),
(2, 'Priya Patel', 'priya@gmail.com', 'Pune', '2024-02-10'),
(3, 'Rahul Verma', 'rahul@gmail.com', 'Delhi', '2024-02-22'),
(4, 'Sneha Joshi', 'sneha@gmail.com', 'Nashik', '2024-03-05'),
(5, 'Rohan Mehta', 'rohan@gmail.com', 'Mumbai', '2024-03-18'),
(6, 'Ananya Shah', 'ananya@gmail.com', 'Ahmedabad', '2024-04-01'),
(7, 'Vikram Patil', 'vikram@gmail.com', 'Pune', '2024-04-15'),
(8, 'Neha Kulkarni', 'neha@gmail.com', 'Nagpur', '2024-05-03'),
(9, 'Karan Singh', 'karan@gmail.com', 'Delhi', '2024-05-20'),
(10, 'Meera Iyer', 'meera@gmail.com', 'Bangalore', '2024-06-08');

-- Products
INSERT INTO products VALUES
(101, 'Laptop', 'Electronics', 65000.00),
(102, 'Wireless Mouse', 'Electronics', 1200.00),
(103, 'Mechanical Keyboard', 'Electronics', 3500.00),
(104, 'Office Chair', 'Furniture', 8500.00),
(105, 'Desk Lamp', 'Furniture', 1800.00),
(106, 'Backpack', 'Accessories', 2200.00),
(107, 'Headphones', 'Electronics', 4500.00),
(108, 'Monitor', 'Electronics', 18000.00),
(109, 'Notebook', 'Stationery', 300.00),
(110, 'Water Bottle', 'Accessories', 900.00);

-- Orders
INSERT INTO orders VALUES
(1001, 1, '2024-06-10', 66200.00, 'Completed'),
(1002, 2, '2024-06-15', 5300.00, 'Completed'),
(1003, 3, '2024-07-02', 8500.00, 'Completed'),
(1004, 1, '2024-07-18', 18000.00, 'Completed'),
(1005, 4, '2024-08-05', 4000.00, 'Completed'),
(1006, 5, '2024-08-12', 4500.00, 'Cancelled'),
(1007, 6, '2024-08-25', 87500.00, 'Completed'),
(1008, 7, '2024-09-03', 3100.00, 'Completed'),
(1009, 8, '2024-09-15', 2200.00, 'Completed'),
(1010, 9, '2024-10-01', 68500.00, 'Completed'),
(1011, 10, '2024-10-12', 5300.00, 'Completed'),
(1012, 3, '2024-10-25', 4500.00, 'Completed'),
(1013, 5, '2024-11-05', 18000.00, 'Completed'),
(1014, 2, '2024-11-18', 8500.00, 'Completed'),
(1015, 7, '2024-12-02', 6800.00, 'Completed');

-- Order Items
INSERT INTO order_items VALUES
(1, 1001, 101, 1, 65000.00),
(2, 1001, 102, 1, 1200.00),

(3, 1002, 103, 1, 3500.00),
(4, 1002, 109, 6, 300.00),

(5, 1003, 104, 1, 8500.00),

(6, 1004, 108, 1, 18000.00),

(7, 1005, 105, 2, 1800.00),
(8, 1005, 110, 1, 900.00),

(9, 1006, 107, 1, 4500.00),

(10, 1007, 101, 1, 65000.00),
(11, 1007, 108, 1, 18000.00),
(12, 1007, 102, 1, 1200.00),
(13, 1007, 103, 1, 3500.00),

(14, 1008, 106, 1, 2200.00),
(15, 1008, 110, 1, 900.00),

(16, 1009, 106, 1, 2200.00),

(17, 1010, 101, 1, 65000.00),
(18, 1010, 102, 1, 1200.00),
(19, 1010, 109, 1, 300.00),

(20, 1011, 103, 1, 3500.00),
(21, 1011, 110, 2, 900.00),

(22, 1012, 107, 1, 4500.00),

(23, 1013, 108, 1, 18000.00),

(24, 1014, 104, 1, 8500.00),

(25, 1015, 107, 1, 4500.00),
(26, 1015, 105, 1, 1800.00);
