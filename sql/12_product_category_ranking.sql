-- Phase 5.1: Product Ranking Within Category
-- Business Question:
-- Which products generate the most profit within each category?
--
-- SQL Concepts:
-- CTEs
-- RANK()
-- PARTITION BY
-- Window functions

WITH product_profit AS (
    SELECT
        product_id,
        product_name,
        category,
        sub_category,
        ROUND(SUM(sales), 2) AS total_sales,
        ROUND(SUM(profit), 2) AS total_profit
    FROM retail.superstore
    GROUP BY
        product_id,
        product_name,
        category,
        sub_category
)

SELECT
    category,
    sub_category,
    product_id,
    product_name,
    total_sales,
    total_profit,
    RANK() OVER (
        PARTITION BY category
        ORDER BY total_profit DESC
    ) AS profit_rank
FROM product_profit
ORDER BY category, profit_rank;


WITH product_profit AS (
    SELECT
        product_id,
        product_name,
        category,
        sub_category,
        ROUND(SUM(sales), 2) AS total_sales,
        ROUND(SUM(profit), 2) AS total_profit
    FROM retail.superstore
    GROUP BY
        product_id,
        product_name,
        category,
        sub_category
),

ranked_products AS (
    SELECT
        category,
        sub_category,
        product_id,
        product_name,
        total_sales,
        total_profit,
        RANK() OVER (
            PARTITION BY category
            ORDER BY total_profit DESC
        ) AS profit_rank
    FROM product_profit
)

SELECT
    category,
    profit_rank,
    product_id,
    product_name,
    sub_category,
    total_sales,
    total_profit
FROM ranked_products
WHERE profit_rank <= 3
ORDER BY category, profit_rank;