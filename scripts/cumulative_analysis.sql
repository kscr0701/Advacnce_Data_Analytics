--CUMULATIVE ANALYSIS
--Aggregate data progressively over the time.

-- Task: calculate the total sales per montth and the running total of sales over time

SELECT
order_date,
total_sales,
SUM(total_sales) OVER(ORDER BY order_date) AS running_totalsales,
AVG(Avg_price) OVER(PARTITION BY order_date ORDER BY order_date) AS Moving_avg_price
FROM                                                              -- default frame row between unbounded preceding and current row--
(
SELECT
DATETRUNC(month,order_date) AS order_date,
SUM(sales_amount) AS total_sales,
AVG(price) AS Avg_price
FROM gold.fact_sales
WHERE order_date IS NOT NULL
GROUP BY DATETRUNC(month,order_date)
)t