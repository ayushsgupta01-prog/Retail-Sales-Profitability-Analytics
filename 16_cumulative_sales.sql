WITH yearly_sales AS (
    SELECT
        EXTRACT(YEAR FROM order_date)::INTEGER AS year,
        ROUND(SUM(sales), 2) AS total_sales
    FROM retail.superstore
    GROUP BY EXTRACT(YEAR FROM order_date)
)

SELECT
    year,
    total_sales,
    ROUND(
        SUM(total_sales) OVER (
            ORDER BY year
            ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
        ),
        2
    ) AS cumulative_sales
FROM yearly_sales
ORDER BY year;