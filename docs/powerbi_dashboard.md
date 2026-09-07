Sure. Here is the **complete `powerbi_dashboard.md` content in a single text box** so you can copy-paste it directly into the file.

````text
# Power BI Dashboard Documentation

## 1. Overview

The Power BI dashboard is the business intelligence layer of the **Retail Sales & Profitability Analytics using SQL & Power BI** project.

The objective is to transform the validated Superstore dataset stored in PostgreSQL into an interactive business intelligence dashboard that enables analysis of sales performance, profitability, product performance, regional performance, and monthly trends.

The dashboard was developed using Power BI Desktop and connected to the PostgreSQL database containing the validated `retail.superstore` table.

---

## 2. Dashboard Objective

The dashboard was designed to provide a concise executive view of the business and answer the following questions:

- What are the overall sales and profit?
- How many orders and customers does the business have?
- How many units have been sold?
- What is the overall profit margin?
- How do sales and profit change over time?
- Which product sub-categories generate the most profit?
- Which categories generate the most sales and profit?
- Which regions perform best?
- Which regions have weaker profitability?
- How does regional filtering affect business performance?

The dashboard follows a one-page executive reporting approach, allowing key business metrics and trends to be viewed without navigating across multiple report pages.

---

## 3. Data Source

The dashboard is based on the validated Superstore dataset stored in PostgreSQL.

### Database Details

| Property | Value |
|---|---|
| Database | `retail_analytics` |
| Schema | `retail` |
| Table | `superstore` |
| Records | 9,994 |
| Database System | PostgreSQL |

The source table contains transaction-level sales records covering the period from **January 3, 2014 to December 30, 2017**.

### Important Analytical Fields

The dashboard uses the following fields:

- `order_date`
- `order_id`
- `customer_id`
- `category`
- `sub_category`
- `region`
- `sales`
- `quantity`
- `profit`

The data was validated during the SQL/database stages before being used for Power BI analysis.

---

## 4. Power BI Connection

Power BI Desktop was used as the visualization and business intelligence layer.

The report was connected to the PostgreSQL database containing the `retail.superstore` table.

### Connection Architecture

```text
PostgreSQL
    ↓
retail.superstore
    ↓
Power BI Desktop
    ↓
DAX Measures
    ↓
Interactive Dashboard
````

The PostgreSQL database remains the underlying analytical data source.

The local database is not intended to be directly exposed to the public. A separate secure deployment approach will be established for the live portfolio version of the project.

---

## 5. Data Model

The primary analytical table used by the dashboard is:

```text
retail.superstore
```

The table contains transaction-level records.

The dashboard calculations are based on the underlying sales, quantity, profit, order, customer, category, sub-category, region, and date fields.

### Important Modeling Consideration

A single `order_id` can occur across multiple rows because one order may contain multiple products or transaction lines.

Therefore, order-related KPIs use:

```DAX
DISTINCTCOUNT('retail.superstore'[order_id])
```

rather than a simple row count.

Similarly, customer count uses distinct customer IDs.

This prevents transaction-row duplication from overstating the number of orders or customers.

---

# 6. DAX Measures

Six primary DAX measures were created for the dashboard.

## 6.1 Total Sales

```DAX
Total Sales =
SUM('retail.superstore'[sales])
```

### Purpose

Calculates the total sales generated across all transaction records.

### Result

```text
2,297,201.07
```

---

## 6.2 Total Profit

```DAX
Total Profit =
SUM('retail.superstore'[profit])
```

### Purpose

Calculates the total profit generated across all transaction records.

### Result

```text
286,397.79
```

---

## 6.3 Total Orders

```DAX
Total Orders =
DISTINCTCOUNT('retail.superstore'[order_id])
```

### Purpose

Calculates the number of unique orders.

A distinct count is required because one order can contain multiple transaction rows.

### Result

```text
5,009
```

---

## 6.4 Total Customers

```DAX
Total Customers =
DISTINCTCOUNT('retail.superstore'[customer_id])
```

### Purpose

Calculates the number of unique customers.

### Result

```text
793
```

---

## 6.5 Total Quantity

```DAX
Total Quantity =
SUM('retail.superstore'[quantity])
```

### Purpose

Calculates the total number of units sold.

### Result

```text
37,873
```

---

## 6.6 Profit Margin %

```DAX
Profit Margin % =
DIVIDE(
    [Total Profit],
    [Total Sales],
    0
)
```

### Purpose

Calculates the percentage of sales retained as profit.

Formula:

```text
Profit Margin = Total Profit / Total Sales
```

The `DIVIDE()` function is used to safely handle cases where the denominator could be zero.

### Result

```text
12.47%
```

---

# 7. Dashboard Structure

The report contains one primary dashboard page.

### Page Name

```text
Sales & Profitability Dashboard
```

### Dashboard Title

```text
Retail Sales & Profitability Dashboard
```

### Page Format

```text
16:9
```

The dashboard contains:

1. Six KPI cards
2. Monthly Sales & Profit Trend
3. Profit by Sub-Category
4. Sales & Profit by Category
5. Sales & Profit by Region
6. Region Filter

The layout follows an executive-dashboard structure where high-level KPIs appear first, followed by trend and comparative analysis.

---

# 8. KPI Cards

Six KPI cards are positioned at the top of the dashboard.

| KPI             | DAX Measure         |       Result |
| --------------- | ------------------- | -----------: |
| Total Sales     | `[Total Sales]`     | 2,297,201.07 |
| Total Profit    | `[Total Profit]`    |   286,397.79 |
| Total Orders    | `[Total Orders]`    |        5,009 |
| Total Customers | `[Total Customers]` |          793 |
| Total Quantity  | `[Total Quantity]`  |       37,873 |
| Profit Margin   | `[Profit Margin %]` |       12.47% |

### Purpose

The KPI cards provide an immediate summary of overall business performance.

They allow a user to understand the scale of the business before examining detailed trends and breakdowns.

---

# 9. Monthly Sales & Profit Trend

## Visual Information

| Property    | Value                        |
| ----------- | ---------------------------- |
| Visual Type | Line Chart                   |
| Title       | Monthly Sales & Profit Trend |
| X-Axis      | Order Date                   |
| Values      | Total Sales, Total Profit    |

### Purpose

The chart shows how sales and profit changed month by month from 2014 through 2017.

It helps identify:

* Sales growth over time
* Profit trends
* High-performing periods
* Weak profitability periods
* Seasonal patterns
* Changes in business performance

A continuous date axis was used to provide a cleaner representation of the monthly trend.

### Analytical Observation

Overall sales increased substantially toward the later years of the dataset, with 2017 generating the highest annual sales.

---

# 10. Sales & Profit by Category

## Visual Information

| Property       | Value                      |
| -------------- | -------------------------- |
| Visual Type    | Clustered Column Chart     |
| Title          | Sales & Profit by Category |
| Category Field | Category                   |
| Values         | Total Sales, Total Profit  |

### Categories

* Furniture
* Office Supplies
* Technology

### Purpose

This visual compares sales and profitability across the three major product categories.

### Key Findings

| Category        |      Sales |     Profit | Profit Margin |
| --------------- | ---------: | ---------: | ------------: |
| Technology      | 836,154.10 | 145,455.66 |        17.40% |
| Office Supplies | 719,046.99 | 122,490.88 |        17.04% |
| Furniture       | 741,999.98 |  18,451.25 |         2.49% |

Technology produces the highest total profit and has the highest category-level profit margin.

Furniture generates substantial sales but significantly lower profitability.

This indicates that high sales volume does not necessarily translate into strong profitability.

---

# 11. Sales & Profit by Region

## Visual Information

| Property     | Value                     |
| ------------ | ------------------------- |
| Visual Type  | Clustered Column Chart    |
| Title        | Sales & Profit by Region  |
| Region Field | Region                    |
| Values       | Total Sales, Total Profit |

### Regions

* Central
* East
* South
* West

### Regional Performance

| Region  |      Sales |     Profit | Profit Margin |
| ------- | ---------: | ---------: | ------------: |
| West    | 725,457.93 | 108,418.79 |        14.94% |
| East    | 678,781.36 |  91,522.84 |        13.48% |
| South   | 391,721.90 |  46,749.71 |        11.93% |
| Central | 501,239.88 |  39,706.45 |         7.92% |

### Key Findings

The West region generates the highest total profit.

The Central region has the lowest profit margin among the four regions.

The regional comparison demonstrates why both sales and profit should be evaluated when assessing geographic performance.

---

# 12. Profit by Sub-Category

## Visual Information

| Property       | Value                  |
| -------------- | ---------------------- |
| Visual Type    | Bar Chart              |
| Title          | Profit by Sub-Category |
| Category Field | Sub-Category           |
| Value          | Total Profit           |

### Purpose

The visual ranks product sub-categories according to their contribution to profitability.

It helps identify:

* Highly profitable sub-categories
* Moderate-profit sub-categories
* Low-profit sub-categories
* Loss-making sub-categories

### Important Findings

Some of the strongest sub-categories include:

* Copiers
* Phones
* Accessories
* Paper
* Binders

Some sub-categories produce negative total profit:

* Tables
* Bookcases
* Supplies

The sub-category chart contains a scrollbar because there are 17 sub-categories and displaying all values simultaneously would reduce readability.

---

# 13. Region Filter

## Visual Information

| Property    | Value         |
| ----------- | ------------- |
| Visual Type | Slicer        |
| Title       | Region Filter |
| Field       | Region        |

### Available Values

* Central
* East
* South
* West

### Purpose

The Region Filter allows users to dynamically filter the dashboard by geographical region.

When a region is selected:

* KPI values update
* Sales and profit calculations update
* Category analysis updates
* Sub-category analysis updates
* Monthly trends update
* Regional analysis responds to the selected filter context

The slicer was manually tested to confirm that selecting a region changes the dashboard metrics correctly.

---

# 14. Dashboard Layout

The dashboard uses a 16:9 report page.

The general layout is:

```text
┌──────────────────────────────────────────────────────────┐
│          Retail Sales & Profitability Dashboard          │
├──────────────────────────────────────────────────────────┤
│ Sales │ Profit │ Orders │ Customers │ Quantity │ Margin │
├───────────────────────────┬──────────────────────────────┤
│                           │                              │
│ Monthly Sales &           │ Profit by Sub-Category       │
│ Profit Trend              │                              │
│                           │                              │
├───────────────────────────┼──────────────────────────────┤
│                           │                              │
│ Sales & Profit            │ Sales & Profit               │
│ by Category               │ by Region                    │
│                           │                              │
├──────────────────────────────────────────────────────────┤
│ Region Filter                                              │
└──────────────────────────────────────────────────────────┘
```

The layout prioritizes information in the following order:

1. Overall business KPIs
2. Time-based performance
3. Product profitability
4. Category performance
5. Regional performance
6. Interactive filtering

---

# 15. Dashboard Formatting

The dashboard was formatted to maintain consistency and readability.

### Page

* 16:9 page size

### Typography

* Segoe UI
* Consistent visual titles
* Dashboard title emphasized using larger, bold text

### KPI Cards

* Sales, Profit and Profit Margin use two decimal places
* Orders, Customers and Quantity use zero decimal places
* Display units set to None
* Compact card layout

### Charts

* Appropriate display units used for large monetary values
* Axis titles removed where they were not necessary
* Legends simplified to clear measure names
* Consistent chart titles

### General Design Principle

The dashboard prioritizes:

* Readability
* Consistency
* Business relevance
* Compact presentation
* Easy comparison

Minor display-formatting limitations were accepted where they did not affect analytical correctness.

---

# 16. Dashboard Validation

Validation was performed by comparing Power BI calculations against PostgreSQL results.

## KPI Validation

| Metric          |     Power BI |   PostgreSQL | Status |
| --------------- | -----------: | -----------: | ------ |
| Total Sales     | 2,297,201.07 | 2,297,201.07 | ✓      |
| Total Profit    |   286,397.79 |   286,397.79 | ✓      |
| Total Orders    |        5,009 |        5,009 | ✓      |
| Total Customers |          793 |          793 | ✓      |
| Total Quantity  |       37,873 |       37,873 | ✓      |
| Profit Margin   |       12.47% |       12.47% | ✓      |

All primary KPI values matched the PostgreSQL analytical results.

## Visual Validation

The following visuals were checked against the underlying SQL analysis:

* Monthly Sales & Profit Trend
* Sales & Profit by Category
* Sales & Profit by Region
* Profit by Sub-Category

The Region Filter was also tested by selecting individual regions and confirming that the dashboard responded correctly.

---

# 17. SQL Validation

Power BI results were cross-checked against PostgreSQL analytical queries developed during the SQL analysis stages.

The validation process ensures that:

```text
Source Data
     ↓
PostgreSQL Calculations
     ↓
Power BI Calculations
     ↓
Matching Results
```

This provides confidence that the dashboard is based on accurate calculations rather than manually entered values.

The project uses SQL as the primary analytical foundation and Power BI as the visualization layer.

---

# 18. Key Business Insights

## 18.1 Overall Performance

The business generated:

* Total Sales: approximately **$2.30M**
* Total Profit: approximately **$286.40K**
* Total Orders: **5,009**
* Total Customers: **793**
* Total Quantity: **37,873**
* Profit Margin: approximately **12.47%**

---

## 18.2 Sales Growth

Annual sales increased strongly after 2015.

| Year |      Sales |    Profit | Profit Margin |
| ---- | ---------: | --------: | ------------: |
| 2014 | 484,247.56 | 49,544.06 |        10.23% |
| 2015 | 470,532.46 | 61,618.69 |        13.10% |
| 2016 | 609,205.86 | 81,795.27 |        13.43% |
| 2017 | 733,215.19 | 93,439.77 |        12.74% |

Sales grew significantly in 2016 and 2017.

---

## 18.3 Category Profitability

Technology is the strongest major category from a profitability perspective.

Its profit margin is approximately:

```text
17.40%
```

Furniture has a much lower margin:

```text
2.49%
```

This demonstrates that revenue contribution and profit contribution can differ significantly.

---

## 18.4 Regional Performance

The West region has the highest total profit:

```text
$108,418.79
```

The Central region has the lowest regional profit margin:

```text
7.92%
```

This suggests that regional performance should be evaluated using profitability as well as revenue.

---

## 18.5 Sub-Category Profitability

Several sub-categories contribute strongly to profitability, while others generate losses.

Particularly important loss-making sub-categories include:

* Tables
* Bookcases
* Supplies

These categories should be investigated further from the perspective of:

* Pricing
* Discounts
* Product costs
* Product mix
* Sales strategy

---

## 18.6 Discount and Profitability

The SQL analysis indicates a strong association between higher discount levels and lower profitability.

At high discount levels, the dataset contains substantial negative profit.

However, this should be interpreted as an observed relationship rather than proof of causation.

Further analysis would be required to determine the exact causal effect of discounting.

---

# 19. Business Recommendations

Based on the analysis, the following areas can be considered for further business investigation.

### 1. Review Furniture Profitability

Furniture generates significant sales but relatively low profit margin.

Pricing, cost structure, and discount strategy should be reviewed.

### 2. Investigate Loss-Making Sub-Categories

Tables, Bookcases, and Supplies show negative profitability.

These product groups should receive additional analysis before further investment or aggressive discounting.

### 3. Review Discount Strategy

High discounts are associated with poor profitability.

Discount policies should consider product-level margins rather than applying broad discounts without profitability controls.

### 4. Leverage Strong Technology Performance

Technology generates strong sales and profitability.

High-performing products and sub-categories can be studied to identify successful pricing and product strategies.

### 5. Investigate Central Region Performance

Central has the lowest regional profit margin.

Further investigation could examine its product mix, discount levels, customer segments, and category performance.

---

# 20. Technical Skills Demonstrated

This dashboard demonstrates practical experience with:

* Power BI Desktop
* DAX
* PostgreSQL
* SQL analytics
* Data visualization
* KPI development
* Business intelligence
* Interactive dashboards
* Slicers and filtering
* Data validation
* Dashboard design
* Business-oriented data storytelling
* Analytical reporting

---

# 21. Project Architecture

The complete analytical workflow is:

```text
Sample Superstore CSV
        ↓
Data Profiling & Validation
        ↓
PostgreSQL Database
        ↓
retail.superstore
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
Deployment
        ↓
GitHub Portfolio + Live Demo
```

Power BI therefore acts as the business intelligence and visualization layer on top of a validated SQL-based analytical workflow.

---

# 22. Deployment Status

The Power BI dashboard has been completed and validated in Power BI Desktop.

### Current Status

```text
Dataset Profiling         → Complete
PostgreSQL Setup          → Complete
Data Validation           → Complete
Exploratory SQL           → Complete
Advanced SQL              → Complete
Analytical SQL Views      → Complete
Power BI Dashboard        → Complete
DAX Measures              → Complete
Dashboard Validation      → Complete
Power BI Deployment       → Pending
Live Demo                 → Pending
GitHub Portfolio          → Pending
CV Integration            → Pending
```

The PostgreSQL database currently runs locally and is not directly exposed to the public.

A secure deployment architecture will be established before publishing the project as a live portfolio project.

---

# 23. Future Enhancements

Potential future improvements include:

* Additional customer-level dashboard pages
* Product-level drill-through analysis
* Advanced profitability segmentation
* Customer retention analysis
* Discount optimization analysis
* Automated data refresh
* Cloud database deployment
* Power BI Service deployment
* Live portfolio demonstration
* Additional interactive filters

These enhancements are outside the scope of the current one-page executive dashboard.

---

# 24. Phase Completion

The Power BI dashboard successfully converts the validated PostgreSQL dataset into an interactive business intelligence report.

The completed dashboard provides an executive-level view of:

* Sales
* Profit
* Orders
* Customers
* Quantity
* Profit Margin
* Monthly performance
* Category performance
* Sub-category profitability
* Regional performance

The dashboard has been validated against PostgreSQL results and is ready for the next stage: **secure deployment and portfolio integration**.

```

Save it. Then we can move on to the **deployment stage**.
```
