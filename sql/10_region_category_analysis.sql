-- ============================================================
-- Retail Sales & Profitability Analytics
-- Phase 4.11 — Regional + Category Analysis
-- ============================================================

SELECT
    region,
    category,
    ROUND(SUM(sales), 2) AS total_sales,
    ROUND(SUM(profit), 2) AS total_profit,
    ROUND(
        (SUM(profit) / NULLIF(SUM(sales), 0)) * 100,
        2
    ) AS profit_margin_pct
FROM retail.superstore
GROUP BY region, category
ORDER BY region, total_profit ASC;