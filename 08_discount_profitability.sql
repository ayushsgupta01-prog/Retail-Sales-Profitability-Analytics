-- ============================================================
-- Retail Sales & Profitability Analytics
-- Phase 4.8 — Discount vs Profitability
-- ============================================================

SELECT
    discount,
    COUNT(*) AS transaction_rows,
    COUNT(DISTINCT order_id) AS total_orders,
    ROUND(SUM(sales), 2) AS total_sales,
    ROUND(SUM(profit), 2) AS total_profit,
    ROUND(
        (SUM(profit) / NULLIF(SUM(sales), 0)) * 100,
        2
    ) AS profit_margin_pct
FROM retail.superstore
GROUP BY discount
ORDER BY discount;