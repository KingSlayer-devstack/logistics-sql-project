CREATE TABLE Warehouse_stock
product_id INT PRIMARY KEY,
product_name VARCHAR(100),
category VARCHAR(50),
price DECIMAL(10, 2),
quantity_INT
shelf_location VARCHAR(10)
INSERT INTO Warehouse_stock (product id, product_name, category, price, quantity, shelf_location)
(101, 'Natura Ekos Soap' , 'Personal Care', 25.00, 150, 'A-12'),
(102, 'Portobello Tile Grey' , 'Construction', 120.00 , 0, 'B-05'),
(103, 'Essential Oil Kit' , 'Personal Care', 210.00, 45, 'A-15)
