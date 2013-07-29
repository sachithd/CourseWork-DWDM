SELECT Distinct SM.store_id,SM.month_of_year-12,AVG(SM.store_sales) 
OVER (
PARTITION BY SM.store_ID
ORDER BY SM.month_of_year
RANGE 2 PRECEDING)
AS "3 MONTH AVERAGE SALES"
FROM 
(SELECT store_id,store_sales,month_of_year FROM 
(SELECT s.store_id,s.store_sales,t.month_of_year as month_of_year,t.the_month 
	FROM sales_fact_1997 s,time_by_day t 
		WHERE t.time_id=s.time_id 
		UNION ALL
SELECT s.store_id,s.store_sales,t.month_of_year+12 as month_of_year,t.the_month  
	FROM sales_fact_1998 s,time_by_day t 
		WHERE t.time_id=s.time_id 	
		UNION ALL
SELECT s.store_id,s.store_sales,t.month_of_year+12 as month_of_year,t.the_month  
	FROM sales_fact_DEC_1998 s,time_by_day t 
		WHERE t.time_id=s.time_id 
		)
) SM where SM.month_of_year>12 order by SM.store_id,SM.month_of_year-12;


