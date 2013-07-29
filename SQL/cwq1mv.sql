DROP MATERIALIZED VIEW mv_salesfact;

CREATE MATERIALIZED VIEW 
          mv_salesfact
build immediate
refresh on demand 
enable query rewrite 
as 
SELECT store_id,avg(store_sales) as store_sales,month_of_year,the_month from 
(SELECT s.store_id,avg(s.store_sales) as store_sales,t.month_of_year,t.the_month 
	FROM sales_fact_1997 s,time_by_day t 
		WHERE t.time_id=s.time_id 
		GROUP BY s.store_id,t.month_of_year,t.the_month 
		UNION ALL
SELECT s.store_id,avg(s.store_sales)as store_sales,t.month_of_year+12 as month_of_year,t.the_month  
	FROM sales_fact_1998 s,time_by_day t 
		WHERE t.time_id=s.time_id 
		GROUP BY s.store_id,t.month_of_year,t.the_month 		
		UNION ALL
SELECT s.store_id,avg(s.store_sales)as store_sales,t.month_of_year+12 as month_of_year,t.the_month  
	FROM sales_fact_DEC_1998 s,time_by_day t 
		WHERE t.time_id=s.time_id 
		GROUP BY s.store_id,t.month_of_year,t.the_month)
group by store_id,month_of_year,the_month
order by store_id,month_of_year,the_month;


ALTER SESSION SET QUERY_REWRITE_ENABLED = TRUE;
ALTER SESSION SET QUERY_REWRITE_INTEGRITY = ENFORCED;


