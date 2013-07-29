rem     /home/nigel/public/plan_examp_9d.sql
rem
rem	Find the supplier number, part number, project number and 
rem	total weight of the parts supplied where the total weight 
rem	is the maximum for any supply instance.
rem
rem	This query illustrates:
rem
rem	- the use of an arithmetical operator * (multiplication).
rem	  Also available are + - / (division),
rem
rem	- the use of an aggregate function (in this case MAX)
rem	  in a nested query.


rem     Here comes the EXPLAIN PLAN statement which generates the plan
rem     information and stores it in table PLAN_TABLE. A statement id
rem     is used to identify the rows for a particular plan.

DELETE FROM PLAN_TABLE WHERE STATEMENT_ID = 'fme22';

EXPLAIN PLAN SET STATEMENT_ID = 'fme22' FOR
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
	



rem     The generated plan information can then be displayed in a nested
rem     form using the following SELECT statement.


SELECT LPAD(' ', 2*LEVEL) || OPERATION || ' ' || OPTIONS || ' ' ||
       OBJECT_NAME || ' ' || DECODE(ID, 0, 'Cost = ' || POSITION) "Query Plan"
FROM PLAN_TABLE WHERE STATEMENT_ID =  'fme22'
CONNECT BY PRIOR ID = PARENT_ID AND STATEMENT_ID = 'fme22'
START WITH ID = 0 AND STATEMENT_ID = 'fme22';

rem	To delete the rows in PLAN_TABLE for a plan with a particular 
rem     statement id we can use:

DELETE FROM PLAN_TABLE WHERE STATEMENT_ID = 'fme22';
