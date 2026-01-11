CREATE TABLE Warehouse_stock (
product_id INT PRIMARY KEY,
product_name VARCHAR(100),
category VARCHAR(50),
price DECIMAL(10, 2),
quantity INT,
shelf_location VARCHAR(10)
);

INSERT INTO Warehouse_stock (product_id, product_name, category, price, quantity, shelf_location)
VALUES
(101, 'Natura Ekos Soap' , 'Personal Care', 25.00, 150, 'A-12'),
(102, 'Portobello Tile Grey' , 'Construction', 120.00 , 0, 'B-05'),
(103, 'Essential Oil Kit' , 'Personal Care', 210.00, 45, 'A-15');

SELECT product_name, (price * quantity) AS total_stock_value
FROM Warehous_stock
