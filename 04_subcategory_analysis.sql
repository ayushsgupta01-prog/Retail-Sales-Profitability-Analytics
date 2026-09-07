-- ============================================================
-- Retail Sales & Profitability Analytics
-- Phase 4.4 — Sub-Category Analysis
-- ============================================================

SELECT
    sub_category,
    category,
    ROUND(SUM(sales), 2) AS total_sales,
    ROUND(SUM(profit), 2) AS total_profit,
    SUM(quantity) AS total_quantity,
    COUNT(DISTINCT order_id) AS total_orders,
    ROUND(
        (SUM(profit) / NULLIF(SUM(sales), 0)) * 100,
        2
    ) AS profit_margin_pct
FROM retail.superstore
GROUP BY sub_category, category
ORDER BY total_profit DESC;