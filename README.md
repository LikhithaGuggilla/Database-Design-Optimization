# **Database Design and Optimization for Healthcare Electronic Claims**

## **Objective**

A data management solution aimed at designing a relational database for managing healthcare electronic claims data and improve data management for providers with proper optimization techniques.

---
**Data:** Simulated patient and claims data using 'Faker' and 'Random' python module and automated insertion establishing database connectivity from google colab using python script.

**Tools/Technologies:** Amazon RDS, DBeaver, SQL, Draw.io

---
**Business Process Modeling & ERD**
1. Modeled business process (swim lane flowchart for claim life cycle using Visio); Identified essential entities, attributes, relationships and cardinality.
2. Designed Entity-Relationship diagram with 3NF using Draw.io ensuring referential integrity (Primary & Foreign Keys) & data consistency while minimizing redundancy.

![ERD](https://github.com/LikhithaGuggilla/Database-Management-SQL/blob/main/Images/ERD.png)

**Database Implementation & Optimization**
1. Deployed MariaDB on Amazon RDS with implementation of table schemas, constraints and indexes; Tested the database functionality and integrity with a small batch data using SQL scripts in DBeaver.
2. Analyzed SQL query response time using execution plan analysis (EXPLAIN ANALYZE) while generating reports like claim status, processing time etc reducing latency by 50% with indexing strategies and query optimization (CTEs, aggregations, views etc).
---

**Business Impact:**
Data management and claim processing for healthcare providers can be improved with 50% faster claims-related report generation.


 

