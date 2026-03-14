Warehouse_stock: Inventory Monitoring & Automation
Bridging the gap between warehouse operations and data-driven solutions.
📌 Project Overview
In industrial logistics, "ghost positions" and manual reconciliation errors lead to significant revenue loss. This project is a Relational SQL Database designed to simulate a high-volume warehouse environment. It automates inventory monitoring, identifies stock discrepancies, and provides real-time alerts for operational inefficiencies.

This project serves as a proof-of-concept for how SQL can be used to solve the exact "floor-level" problems I witnessed during my time at Portobello and Natura.

🚀 Key Features
Relational Architecture: Designed tables for Products, Stock_Locations, Suppliers, and Inventory_Logs with primary and foreign key constraints.

Automated Reconciliation: Complex queries created to compare "Physical Stock" vs. "System Stock" to flag discrepancies.

Ghost Position Detection: Logic implemented to identify locations that are marked as "Full" in the system but are physically empty (and vice versa).

Stock Health Dashboards: Views created to show low-stock alerts and "Slow Moving" items to optimize warehouse throughput.

🛠️ Tech Stack
Language: SQL (PostgreSQL / MySQL)

Tools: [Insert tool you used, e.g., MySQL Workbench, DBeaver, or pgAdmin]

Logic: Joins, Subqueries, CTEs (Common Table Expressions), and Views.

📊 Logic Example (Problem & Solution)
The Problem: At Portobello, items were often lost due to "Ghost Positions."
The SQL Solution:

SQL
-- This query identifies locations where the system shows stock, 
-- but no movement has been recorded in the last 30 days.
SELECT location_id, product_id, last_count_date
FROM inventory_table
WHERE status = 'occupied' 
AND last_movement < CURRENT_DATE - INTERVAL '30 days';
📈 Impact
By implementing this digital framework, a warehouse can:

Reduce Manual Audits: Automating checks reduces the need for constant physical counts.

Increase Accuracy: Eliminates human error in stock reporting.

Recover Revenue: Reduces lost sales caused by "out of stock" errors that are actually hidden in the warehouse.

👤 Author
João Vitor Moura Pinheiro
Logistics Professional & Data Analytics Candidate

www.linkedin.com/in/
kingslayer-devstack
