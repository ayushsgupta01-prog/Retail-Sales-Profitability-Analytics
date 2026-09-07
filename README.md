# Retail Sales & Profitability Analytics

## Project Overview

A business intelligence and analytics project focused on analyzing retail sales performance, profitability, customer behavior, product performance, regional trends, and discount impact using **PostgreSQL, SQL, DAX, and Power BI**.

The project follows an end-to-end analytics workflow, starting from raw Superstore transaction data and progressing through data validation, SQL analysis, advanced analytical queries, Power BI modeling, dashboard development, and deployment.

---

## Business Objective

The objective of this project is to transform raw retail transaction data into actionable business insights that can support decisions related to:

- Sales performance
- Profitability
- Product and sub-category performance
- Regional performance
- Customer behavior
- Discount strategy
- Business growth

---

## Technology Stack

| Technology | Purpose |
|---|---|
| PostgreSQL | Database and analytical SQL |
| SQL | Data validation, exploration and advanced analysis |
| Power BI | Interactive dashboard and visualization |
| DAX | KPI and analytical measures |
| GitHub | Version control and portfolio documentation |
| VS Code / pgAdmin | SQL and database development |

---

## Dataset

The project uses the **Sample Superstore** dataset.

### Dataset Summary

- **Records:** 9,994
- **Columns:** 21
- **Period:** January 3, 2014 – December 30, 2017
- **Categories:** Furniture, Office Supplies, Technology
- **Regions:** Central, East, South, West
- **Segments:** Consumer, Corporate, Home Office

The dataset was profiled and validated before analytical processing.

---

## Project Architecture

```text
Sample Superstore CSV
        ↓
Data Profiling & Validation
        ↓
PostgreSQL Database
        ↓
Validated retail.superstore Table
        ↓
Exploratory SQL Analysis
        ↓
Advanced SQL Analysis
        ↓
Analytical SQL Views
        ↓
Power BI
        ↓
DAX Measures
        ↓
Interactive Dashboard
        ↓
Power BI Service
        ↓
Power BI App
        ↓
GitHub Portfolio + Live Demo

---

## Key Business Metrics

| Metric | Value |
|---|---:|
| Total Sales | $2,297,201.07 |
| Total Profit | $286,397.79 |
| Total Orders | 5,009 |
| Total Customers | 793 |
| Total Quantity | 37,873 |
| Profit Margin | 12.47% |

---

## Key Findings

### Category Performance

Technology generated the highest total profit and achieved a profit margin of approximately **17.40%**.

Furniture generated substantial sales but had a much lower profit margin of approximately **2.49%**.

### Regional Performance

The **West** region generated the highest total profit at approximately **$108.42K**.

The **Central** region had the lowest regional profit margin at approximately **7.92%**.

### Product Profitability

Several sub-categories generated strong profitability, including:

- Copiers
- Phones
- Accessories
- Paper
- Binders

Loss-making sub-categories included:

- Tables
- Bookcases
- Supplies

### Discount Analysis

The SQL analysis identified a strong association between higher discount levels and lower profitability.

This represents an observed relationship in the dataset and should not be interpreted as proof of causation.

---

## Power BI Dashboard

The dashboard provides an executive view of:

- Total Sales
- Total Profit
- Total Orders
- Total Customers
- Total Quantity
- Profit Margin
- Monthly Sales & Profit Trends
- Category Performance
- Regional Performance
- Sub-Category Profitability
- Interactive Region Filtering

A dashboard screenshot will be included in the repository as part of the portfolio documentation.

---

## SQL Analysis

The project includes SQL analysis covering:

- Overall business KPIs
- Yearly performance
- Category analysis
- Sub-category analysis
- Regional analysis
- Segment analysis
- Product profitability
- Discount analysis
- Loss-making products
- Monthly performance
- Year-over-year growth
- Cumulative sales
- Customer analysis
- Customer frequency segmentation
- Advanced ranking using window functions
- CTE-based analysis
- Analytical SQL views

---

## Repository Structure

```text
Retail-Sales-Profitability-Analytics/
│
├── data/
│   └── superstore.csv
│
├── sql/
│   ├── 01_overall_kpis.sql
│   ├── ...
│   └── analytical_view_files.sql
│
├── docs/
│   ├── dataset_profile.md
│   ├── data_dictionary.md
│   ├── project_scope.md
│   ├── database_setup.md
│   └── powerbi_dashboard.md
│
├── powerbi/
│   └── Retail-Sales-Profitability-Analytics.pbix
│
└── screenshots/
    └── dashboard.png
