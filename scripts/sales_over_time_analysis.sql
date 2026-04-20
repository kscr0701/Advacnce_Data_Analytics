USE DataWarehouseAnalytics

-- CHANGE OVER TIME ANALYSIS
-- A highlevel overview insights that helps with strategic decision making. 
--Analyse sales over time with order date

SELECT
	CONCAT(DATENAME(MONTH,order_date),' ', DATENAME(YEAR,order_date)) as order_months,
	SUM(sales_amount) as total_Sales,
	Count(DISTINCT customer_key) as total_customers,
	SUM(quantity) as total_quantity
FROM gold.fact_sales
WHERE order_date IS NOT NULL
GROUP BY CONCAT(DATENAME(MONTH,order_date),' ', DATENAME(YEAR,order_date))
ORDER BY CONCAT(DATENAME(MONTH,order_date),' ', DATENAME(YEAR,order_date))