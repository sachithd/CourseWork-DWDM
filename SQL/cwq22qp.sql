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
