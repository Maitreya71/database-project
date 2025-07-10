# An E-Commerce database created using MySQL
📌 Overview :

This project involves designing and implementing a relational E-commerce database to simulate the backend structure of an online shopping platform. 
It covers key business entities such as customers, products, orders, payments, and inventory, and supports analytical queries for performance tracking and reporting.
Several database objects are created consisting of DDL,DML,DCL and TCL queries, E-R diagram was made and a document containing a final Power BI report of  different metrics was used to draw data insights which could be aesily undertood by both technical and non-technical users.
Different entities like order, customer and transaction containing different attributes were linked using primary-foreign key relationship and then tables were Normalized with 3NF leading to removal of redundant and duplicate entries.  

🔧 Tech Stack:

Database: MySQL 

Data Modeling: ER diagrams using MS Visio, normalization to 3NF,referential integrity constraints 

Query Language: SQL (DDL, DML, DCL, TCL)

Report: Power BI

Tools: MySQL Workbench, MS Visio, Power BI 

📂 Key Features:

Customer Management: Store customer profiles, contact info, and addresses.

Product Catalog: Track product details, categories, pricing, and stock.

Order Processing: Record customer orders, order items, shipment status.

Payment System: Capture payment method, transaction amount, and timestamps.

Inventory Tracking: Monitor stock levels and supplier restocks.

Sales Reporting: SQL queries for KPIs like total revenue, top-selling products, and customer order history.

📦E-commerce database:

 ┣ 📜 Database scripts 
 
       |- ┣ 📜 DMDDProject4_routines.sql     # Routines 
   
       |- ┣ 📜 DDLScripts.sql                # DDL scripts
   
       |- ┣ 📜 InsertScripts.sql             # Insert records 
   
       |- ┣ 📜 Encryption.sql                # encryption scripts
   
       |- ┣ 📜 routinesViewsAndTriggers.sql  # more routines, triggers, stored procedures
   
 ┣ 📜 Database_ERD.pdf                   # ERD diagram using MS Visio
 
 ┣ 📜 script_implementation.pdf          # script summary
 
 ┣ 📜 Database_Implementation.pdf        # database implementation
 
 ┣ 📜 database_presentation.pdf          # Database summary with goals & objectives
 
 ┣ 📜 README.md                          # Project documentation


🚀 How to Use:

Clone the repo

Load " .sql " into your DBMS

Run InsertScripts.sql to populate with sample data

Execute queries from DMDDProject4_routines.sql for analysis


