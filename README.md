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
```sql

SELECT product_name, quantity,
       CASE 
           WHEN quantity = 0 THEN 'OUT OF STOCK'
           WHEN quantity < 20 THEN 'CRITICAL'
           ELSE 'OK'
       END AS stock_status
FROM Warehouse_stock; 

 ```
## 2. Category Financial Analysis
This query identifies which product categories hold the most capital, assisting in insurance and security planning:
```
SELECT category, SUM(price * quantity) AS total_value
FROM Warehouse_stock
GROUP BY category
HAVING SUM(price * quantity) > 500;

```
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
ORDER BY T.transaction_date DESC; ****
```

## 🔧 Troubleshooting: Foreign Key Constraints
As the project evolved into a relational system, I encountered a dependency error:
`Msg 3726: Could not drop object 'Warehouse_stock' because it is referenced by a FOREIGN KEY constraint.`

### How I resolved it:
I implemented a **Hierarchical Cleanup Strategy**. In a relational database, you cannot delete a "Parent" table if a "Child" table still points to it. I updated the script to drop objects in the reverse order of their dependencies:
1. Drop **Stored Procedures** and **Views**.
2. Drop the **Child Table** (`Stock_Transactions`).
3. Drop the **Parent Table** (`Warehouse_stock`).

## 🤖 Phase 3: Performance & Automation
This phase focuses on making the database "intelligent" by automating common warehouse tasks.

### 🛠️ New Technical Features 
* **Database Views:** Created `vw_LowStockAlerts` to act as a real-time dashboard for procurement.
* **Stored Procedures:** Developed `sp_ProcessShipment` to handle outbound orders.
* **Procedural Logic:** Used `IF/ELSE` blocks within SQL to validate stock levels before allowing a transaction to complete.

### 📊 Business Logic: Automated Shipping
Instead of manual updates, the warehouse now uses a single command to process orders. This ensures that the inventory count and the transaction history are always synchronized:

```sql
-- Example of processing a shipment of 10 units
EXEC sp_ProcessShipment @ProdID = 101, @Qty = 10;
```
# 📦 Warehouse_stock: Operational Logistics Database
**From the Warehouse Floor to Data Analytics**

## 🎯 Project Overview
This project is a technical implementation of a **Warehouse Management System (WMS)** built in SQL Server. It transitionally moves from basic data storage to a fully automated, relational system designed to solve real-world inventory inaccuracies.

> "Performance problems are rarely 'mysterious.' They are measurable, traceable, and fixable when a team has the right data." — *Statement of Purpose, Joao Vitor*

## 👤 About the Author
With over two years of experience in high-volume logistics centers in Brazil (including **Natura**, **Portobello**, and **Mercado Livre**), I have seen firsthand how inventory errors impact the bottom line. This project serves as a bridge between my operational background and my future as a **Data Analyst in Canada**.

---

## 🏗️ Technical Architecture
The project is divided into four strategic phases that demonstrate a progression in database development skills:

### **Phase 1: Foundation & Static Inventory**
* **Goal:** Structure core inventory data.
* **Skills:** DDL (Data Definition), DML (Data Manipulation), and Aggregate Functions.

### **Phase 2: Relational Movement & Traceability**
* **Goal:** Move beyond static lists to track every 'IN' and 'OUT' movement.
* **Skills:** Foreign Keys, One-to-Many relationships, and complex **INNER JOINs**.

### **Phase 3: Automation & Performance**
* **Goal:** Reduce manual workload for warehouse managers.
* **Features:** * `vw_LowStockAlerts`: A real-time dashboard for procurement.
    * `sp_ProcessShipment`: A stored procedure that automates outbound orders while maintaining data integrity.

### **Phase 4: Data Integrity & Business Logic**
* **Goal:** Prevent human error at the database level.
* **Skills:** `CHECK Constraints` to ensure zero negative stock or invalid pricing.

---

## 🛠️ Business Logic Highlights
### **Preventing "Ghost Stock"**
By implementing a hierarchical cleanup and strict constraints, this system ensures that:
1. **No Negative Inventory:** It is physically impossible to ship more than what is on the shelf.
2. **Audit Trails:** Every movement is recorded with a timestamp, providing a 100% transparent audit history.

## 🚀 How to Run
1. Open **SQL Server Management Studio (SSMS)**.
2. Copy the full script from `warehouse_stock.sql`.
3. Execute. The script is **idempotent** (can be run multiple times without errors).

---

## 🇨🇦 Career Objective
I am currently applying for **Data Analytics programs in Canada (January 2027)**. My goal is to apply my Brazilian logistics expertise to the Canadian supply chain, utilizing advanced data modeling to drive operational excellence.
Bridging the gap between the warehouse floor and data analytics. A SQL-based logistics system featuring automated inventory tracking and data integrity constraints, inspired by professional experience at Mercado Livre and Natura.
