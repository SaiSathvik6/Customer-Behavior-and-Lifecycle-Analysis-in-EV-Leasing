# 🚗 Alt Mobility – Data Analyst Assignment

## 📋 Overview

This repository contains the solutions to the Data Analyst Intern assignment by **Alt Mobility**, which includes SQL-based analysis and a customer retention visualization. The goal is to derive business insights from `customer_orders.csv` and `payments.csv` related to electric vehicle leasing operations.

---

## 🧩 Problem Statement

Alt Mobility, an EV leasing company managing 20,000+ vehicles, wants to uncover operational and financial insights from its order and payment data. This analysis aims to improve fleet efficiency, customer engagement, and payment processes through data-driven decision making.

---

## 🧠 Approach

I divided the problem into five analytical tasks, each addressed using SQL or Python where required.

---

### ✅ Task 1: Order and Sales Analysis

**Objective:** Analyze order status and sales data to uncover trends in revenue and fulfilment.

**SQL Highlights:**
- Total unique customers
- Revenue trends (monthly & yearly)
- Order distribution by status
- Monthly revenue & order volume pivot tables

**Key Insight:** Revenue and order volumes fluctuate by month, with delivered orders being the dominant status type.

---

### ✅ Task 2: Customer Analysis

**Objective:** Understand customer behavior to detect repeat customers, segment types, and time-based trends.

**SQL Highlights:**
- Repeat customer count
- Customer segmentation (New, Returning, Loyal)
- Monthly order trends
- New customers tracked by cohort

**Key Insight:** A significant portion of customers are repeat buyers, showing strong retention potential in certain months.

---

### ✅ Task 3: Payment Status Analysis

**Objective:** Detect patterns in payment success/failure and assess payment reliability.

**SQL Highlights:**
- Total & average payment amounts
- Payment status breakdown
- Monthly failure/success trends
- Payment failure rate

**Key Insight:** Failed payments are linked to orders in 'pending' or 'shipped' status, suggesting potential process bottlenecks.

---

### ✅ Task 4: Order Details Report

**Objective:** Combine customer orders and payment data for a comprehensive operational view.

**SQL Highlights:**
- Full order-payment join
- Payment timing analysis
- Payment mismatches & unpaid orders
- Payment status vs order fulfillment correlation

**Key Insight:** Most payments occur on or after order dates. A few cases reveal payment before order, which may indicate data quality issues.

---

### ✅ Task 5: Customer Retention Analysis

**Objective:** Visualize cohort retention trends to understand long-term customer behavior.

**Method:**
- Python (`pandas`, `seaborn`) was used to construct a cohort table.
- A heatmap shows how many customers from each month's cohort made repeat purchases in future months.

**Key Insight:** Early cohorts show better retention, indicating loyalty if engagement happens early in the customer lifecycle.
