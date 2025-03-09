# **Design and Optimize Relational Database for Healthcare Electronic Claims Data Management**

## **Project Overview**
This project focuses on optimizing electronic claim submission workflows by restructuring relational data storage, implementing database and query optimizations, and reducing claim processing latency. The initiative enhances database normalization, and transaction throughput, benefiting patients, healthcare providers, and insurance companies.

---

## **Tools/Technologies**
- Amazon RDS, DBeaver, SQL, Draw.io, Google Colab

---

## **Technical Implementation**
Developed and deployed a highly structured RDBMS on Amazon RDS using DBeaver for efficient medical claim processing. A comprehensive Entity-Relationship (ER) Model was implemented with third-normal form (3NF) normalization, ensuring referential integrity while minimizing data redundancy. Additionally, performance tuning strategies, including query indexing, execution plan analysis, and materialized views, resulted in a 50% reduction in query execution time.

---

### **1️⃣ Relational Database Development and Data Insertion**
- Engine: Amazon RDS (MySQL)  
- Schema Design: Optimized ER Model with normalized fact and dimension tables for claims processing.  
- Normalization Techniques: Applied 1NF, 2NF, and 3NF to eliminate redundant data storage.  
- Foreign Key Constraints: Established referential integrity across Patients, Claims, Diagnoses, and Insurance Policies.  

- Created Table schemas in **DBeaver** before Data insertion.  
- Connected to an **AWS RDS (Relational Database Service) instance** using **Google Colab**, carried out data insertion, and verified updates in **DBeaver**.

![ERD](https://github.com/LikhithaGuggilla/Data-Management/blob/main/Design_Optimize_Relational_Database_for_Healthcare_Electronic_Claims/Images/ERD.png)  

---

### **2️⃣ Database Optimization & Performance Tuning**
#### **Indexing Strategy**
- B+ Tree Indexes on high-cardinality attributes (`InsurancePLanID`,`Patient_ID`, `Claim_ID`).  
- Bitmap Indexes on low-cardinality columns(`Claim_Status`).  
- Composite Indexing for multi-column search queries.

![Database Optimization](https://github.com/LikhithaGuggilla/Data-Management/blob/main/Design_Optimize_Relational_Database_for_Healthcare_Electronic_Claims/Images/Database%20Optimization.jpg)

#### **Query Execution Optimization**
- Rewrote nested subqueries into JOIN operations to minimize execution overhead.  
- Used Common Table Expressions (CTEs) for complex analytical queries.  
- Leveraged EXPLAIN ANALYZE to fine-tune SQL queries and remove bottlenecks.  

---

### **3️⃣ Claim Status Reporting & Performance Metrics**
#### **Materialized Views**
- Precomputed aggregate queries for faster report generation.  

#### **Example Analytical Queries**
- Claims > $1000 & pending review extracted via indexed queries.  
- AVG processing time per claim** evaluated using window functions.  

#### **Performance Benchmarking**
- 50% improvement in optimized query execution time compared to the baseline query.  

---
 

