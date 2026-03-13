IF OBJECT_ID('sp_ProcessShipment', 'P') IS NOT NULL DROP PROCEDURE sp_ProcessShipment;
GO

IF OBJECT_ID('vw_LowStockAlerts', 'V') IS NOT NULL DROP VIEW vw_LowStockAlerts;
GO

IF OBJECT_ID('Stock_Transactions', 'U') IS NOT NULL DROP TABLE Stock_Transactions;
GO

IF OBJECT_ID('Warehouse_stock', 'U') IS NOT NULL DROP TABLE Warehouse_stock;
GO

CREATE TABLE Warehouse_stock (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100) NOT NULL,
    category VARCHAR(50),
    price DECIMAL(10, 2) CHECK (price >= 0),
    quantity INT CHECK (quantity >= 0),      
    shelf_location VARCHAR(10)
);

CREATE TABLE Stock_Transactions (
    transaction_id INT PRIMARY KEY IDENTITY(1,1),
    product_id INT,
    movement_type VARCHAR(10) CHECK (movement_type IN ('IN', 'OUT')),
    quantity_changed INT CHECK (quantity_changed > 0),                
    transaction_date DATETIME DEFAULT GETDATE(),
    FOREIGN KEY (product_id) REFERENCES Warehouse_stock(product_id)
);
GO

INSERT INTO Warehouse_stock (product_id, product_name, category, price, quantity, shelf_location)
VALUES
 (101, 'Natura Ekos Soap' , 'Personal Care', 25.00, 150, 'A-12'),
 (102, 'Portobello Tile Grey' , 'Construction', 120.00 , 0, 'B-05'),
 (103, 'Essential Oil Kit' , 'Personal Care', 210.00, 45, 'A-15');

 INSERT INTO Stock_Transactions (product_id, movement_type, quantity_changed)
VALUES 
(101, 'OUT', 15),
(102, 'IN', 100), 
(103, 'OUT', 5);  
GO

CREATE VIEW vw_LowStockAlerts AS
SELECT 
    product_id,
    product_name,
    category,
    quantity AS current_stock,
    shelf_location,
    CASE 
        WHEN quantity = 0 THEN 'OUT OF STOCK'
        ELSE 'REORDER IMMEDIATELY'
    END AS priority_level
FROM Warehouse_stock
WHERE quantity < 20;
GO

CREATE PROCEDURE sp_ProcessShipment
    @ProdID INT,
    @Qty INT
AS
BEGIN
    IF (SELECT quantity FROM Warehouse_stock WHERE product_id = @ProdID) >= @Qty
    BEGIN
        UPDATE Warehouse_stock
        SET quantity = quantity - @Qty
        WHERE product_id = @ProdID;

        INSERT INTO Stock_Transactions (product_id, movement_type, quantity_changed)
        VALUES (@ProdID, 'OUT', @Qty);

        PRINT 'Shipment processed successfully, eh!';
    END
    ELSE
    BEGIN
        PRINT 'Error: Not enough stock for this shipment.';
    END
END
GO
