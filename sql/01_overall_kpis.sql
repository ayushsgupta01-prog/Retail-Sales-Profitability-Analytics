-- ============================================================
-- Retail Sales & Profitability Analytics
-- Phase 4.1 — Overall Business KPIs
-- ============================================================

-- Query 1: Overall Business KPIs
SELECT
    ROUND(SUM(sales), 2) AS total_sales,
    ROUND(SUM(profit), 2) AS total_profit,
    SUM(quantity) AS total_quantity,
    COUNT(DISTINCT order_id) AS total_orders,
    COUNT(DISTINCT customer_id) AS total_customers,
    ROUND(
        (SUM(profit) / NULLIF(SUM(sales), 0)) * 100,
        2
    ) AS profit_margin_pct
FROM retail.superstore;


-- Query 2: Average Order Value
SELECT
    ROUND(
        SUM(sales) / NULLIF(COUNT(DISTINCT order_id), 0),
        2
    ) AS average_order_value
FROM retail.superstore;


-- Query 3: Average Profit per Order
SELECT
    ROUND(
        SUM(profit) / NULLIF(COUNT(DISTINCT order_id), 0),
        2
    ) AS average_profit_per_order
FROM retail.superstore;