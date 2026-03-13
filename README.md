# 📦 Logistics SQL Project: Warehouse Stock Management

> **Bridging Warehouse Expertise and Data Analytics**
> I have over two years of experience in the logistics sector, having worked with automated systems at **Natura** (SSI Shaefer) and inventory management at **Portobello**. This project demonstrates how I translate "floor knowledge" into actionable Data Analytics.

## 🎯 Project Objective
The goal is to manage warehouse inventory, monitor stock levels for Brazilian industry leaders, and generate financial reports to assist in supply chain decision-making.

## 🛠️ Technical Features
* **Data Definition & Manipulation:** Creating structured tables with primary keys and data integrity.
* **Conditional Logic (`CASE` statements):** Automatically classifying stock status (OUT OF STOCK, CRITICAL, or OK).
* **Financial Aggregation (`SUM`, `AVG`):** Calculating total inventory value and average product costs.
* **Business Intelligence Filtering (`HAVING`):** Isolating high-value categories for risk management.
* **Pattern Matching (`LIKE`):** Organizing audits based on specific shelf locations.
* **Relational Mapping:** Established a **One-to-Many** relationship between products and movements.
* **Foreign Keys:** Implemented referential integrity to ensure transaction data always matches an existing product ID.
* **Data Normalization:** Kept product details (price, category) separate from movement details (date, type) to reduce redundancy.
* **Complex Joins (`INNER JOIN`):** Connected the inventory and transaction tables to generate detailed operational reports.
* **Database Abstraction (Views):** Created vw_LowStockAlerts to provide an instant, real-time dashboard for procurement teams, isolating critical stock-outs from the general inventory
  


## 📊 Business Logic Examples

### 1. Stock Status Monitoring
Using a `CASE` statement, the system provides real-time alerts on inventory health to prevent stockouts:
``sql

SELECT product_name, quantity,
       CASE 
           WHEN quantity = 0 THEN 'OUT OF STOCK'
           WHEN quantity < 20 THEN 'CRITICAL'
           ELSE 'OK'
       END AS stock_status
FROM Warehouse_stock;

 ## 2. Category Financial Analysis
This query identifies which product categories hold the most capital, assisting in insurance and security planning:

SELECT category, SUM(price * quantity) AS total_value
FROM Warehouse_stock
GROUP BY category
HAVING SUM(price * quantity) > 500;

 ## Troubleshooting: Handling "Object Already Exists"

During development in SQL Server Management Studio (SSMS), I encountered the following error:
Msg 2714, Level 16, State 3: There is already an object named 'Warehouse_stock' in the database.

## How I resolved it:

To ensure the script is idempotent (runnable multiple times without error), I implemented the following logic:

IF OBJECT_ID(...): Checks if the table exists before attempting creation.

DROP TABLE: Automatically clears old data to allow for a clean fresh install of the environment.

GO Commands: Utilized batch separators to ensure the table is fully dropped/created before the INSERT commands begin.

## ⚙️ How to Run

Environment: Use SQL Server Management Studio (SSMS) or Azure Data Studio.

Execution: Run the full .sql script. It handles the cleanup automatically.

Verification: Check the "Results" tab to view the stock_status and financial KPIs.

Tools used: SQL Server, GitHub, T-SQL.

## 🚀 Phase 2: Relational Data & Transaction Tracking
In this phase, I transitioned the project from a static inventory list to a **Relational Database System**. By introducing a second table, I can now track the flow of goods in and out of the warehouse.

### 📊 Business Logic: Movement History
This query allows a manager to see a complete audit trail of who moved what, when, and for which brand (Natura or Portobello):

```sql
SELECT 
    P.product_name, 
    T.movement_type, 
    T.quantity_changed, 
    T.transaction_date
FROM Warehouse_stock P
INNER JOIN Stock_Transactions T ON P.product_id = T.product_id
ORDER BY T.transaction_date DESC;



