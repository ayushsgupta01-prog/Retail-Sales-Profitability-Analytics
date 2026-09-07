-- ============================================================
-- Retail Sales & Profitability Analytics
-- Phase 4.2 — Yearly Sales & Profit Analysis
-- ============================================================

SELECT
    EXTRACT(YEAR FROM order_date)::INTEGER AS year,
    ROUND(SUM(sales), 2) AS total_sales,
    ROUND(SUM(profit), 2) AS total_profit,
    COUNT(DISTINCT order_id) AS total_orders,
    ROUND(
        (SUM(profit) / NULLIF(SUM(sales), 0)) * 100,
        2
    ) AS profit_margin_pct
FROM retail.superstore
GROUP BY EXTRACT(YEAR FROM order_date)
ORDER BY year;