-- ============================================================
-- Retail Sales & Profitability Analytics
-- Phase 4.9 — Loss-Making Transaction Analysis
-- ============================================================

SELECT
    COUNT(*) AS loss_making_rows,
    COUNT(DISTINCT order_id) AS loss_making_orders,
    ROUND(SUM(sales), 2) AS sales_from_loss_rows,
    ROUND(SUM(profit), 2) AS total_loss
FROM retail.superstore
WHERE profit < 0;

-- ============================================================
-- Query 2: Loss-Making Transactions by Category
-- ============================================================

SELECT
    category,
    COUNT(*) FILTER (WHERE profit < 0) AS loss_making_rows,
    ROUND(
        SUM(sales) FILTER (WHERE profit < 0),
        2
    ) AS loss_row_sales,
    ROUND(
        SUM(profit) FILTER (WHERE profit < 0),
        2
    ) AS total_loss,
    ROUND(
        (
            SUM(profit) FILTER (WHERE profit < 0)
            / NULLIF(
                SUM(sales) FILTER (WHERE profit < 0),
                0
            )
        ) * 100,
        2
    ) AS loss_margin_pct
FROM retail.superstore
GROUP BY category
ORDER BY total_loss ASC;