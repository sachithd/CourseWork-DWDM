SELECT store_id,avg(store_sales) as store_sales,month_of_year-12 as month_of_year from(
SELECT a.store_id,b.store_sales ,a.month_of_year from (SELECT store_id,avg(store_sales) as store_sales,month_of_year,the_month from 
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
group by store_id,month_of_year,the_month) a, (SELECT store_id,avg(store_sales) as store_sales,month_of_year,the_month from 
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
group by store_id,month_of_year,the_month) b where a.month_of_year=b.month_of_year and a.store_id=b.store_id  
UNION ALL
select  a.store_id,b.store_sales ,a.month_of_year from (SELECT store_id,avg(store_sales) as store_sales,month_of_year,the_month from 
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
group by store_id,month_of_year,the_month) a, (SELECT store_id,avg(store_sales) as store_sales,month_of_year,the_month from 
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
group by store_id,month_of_year,the_month) b where a.month_of_year-1=b.month_of_year and a.store_id=b.store_id  
UNION ALL
select  a.store_id,b.store_sales ,a.month_of_year from (SELECT store_id,avg(store_sales) as store_sales,month_of_year,the_month from 
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
group by store_id,month_of_year,the_month) a, (SELECT store_id,avg(store_sales) as store_sales,month_of_year,the_month from 
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
group by store_id,month_of_year,the_month) b where a.month_of_year-2=b.month_of_year and a.store_id=b.store_id )
where month_of_year>12 
group by store_id,month_of_year
order by store_id,month_of_year;
