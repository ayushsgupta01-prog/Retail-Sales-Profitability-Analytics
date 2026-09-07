WITH yearly_sales AS (
    SELECT
        EXTRACT(YEAR FROM order_date)::INTEGER AS year,
        ROUND(SUM(sales), 2) AS total_sales
    FROM retail.superstore
    GROUP BY EXTRACT(YEAR FROM order_date)
),

sales_with_previous_year AS (
    SELECT
        year,
        total_sales,
        LAG(total_sales) OVER (
            ORDER BY year
        ) AS previous_year_sales
    FROM yearly_sales
)

SELECT
    year,
    total_sales,
    previous_year_sales,
    ROUND(
        (
            (total_sales - previous_year_sales)
            / NULLIF(previous_year_sales, 0)
        ) * 100,
        2
    ) AS yoy_sales_growth_pct
FROM sales_with_previous_year
ORDER BY year;