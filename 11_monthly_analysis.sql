-- Phase 4.12: Monthly Sales & Profitability Analysis
-- Purpose: Analyze monthly sales and profit trends from 2014 to 2017.

SELECT
    EXTRACT(YEAR FROM order_date)::INTEGER AS year,
    EXTRACT(MONTH FROM order_date)::INTEGER AS month,
    TO_CHAR(order_date, 'Month') AS month_name,
    ROUND(SUM(sales), 2) AS total_sales,
    ROUND(SUM(profit), 2) AS total_profit
FROM retail.superstore
GROUP BY
    EXTRACT(YEAR FROM order_date),
    EXTRACT(MONTH FROM order_date),
    TO_CHAR(order_date, 'Month')
ORDER BY year, month;