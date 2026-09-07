-- ============================================================
-- Retail Sales & Profitability Analytics
-- Phase 4.7 — Product-Level Analysis
-- Query 1: Top 10 Most Profitable Products
-- ============================================================

SELECT
    product_id,
    product_name,
    category,
    sub_category,
    ROUND(SUM(sales), 2) AS total_sales,
    ROUND(SUM(profit), 2) AS total_profit,
    SUM(quantity) AS total_quantity,
    ROUND(
        (SUM(profit) / NULLIF(SUM(sales), 0)) * 100,
        2
    ) AS profit_margin_pct
FROM retail.superstore
GROUP BY
    product_id,
    product_name,
    category,
    sub_category
ORDER BY total_profit DESC
LIMIT 10;

-- ============================================================
-- Query 2: Top 10 Loss-Making Products
-- ============================================================

SELECT
    product_id,
    product_name,
    category,
    sub_category,
    ROUND(SUM(sales), 2) AS total_sales,
    ROUND(SUM(profit), 2) AS total_profit,
    SUM(quantity) AS total_quantity,
    ROUND(
        (SUM(profit) / NULLIF(SUM(sales), 0)) * 100,
        2
    ) AS profit_margin_pct
FROM retail.superstore
GROUP BY
    product_id,
    product_name,
    category,
    sub_category
HAVING SUM(profit) < 0
ORDER BY total_profit ASC
LIMIT 10;