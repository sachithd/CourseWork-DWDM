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
SELECT store_id,salestotal
FROM(
	SELECT store_id,salestotal,
	RANK() over
	(Order by salestotal DESC) as totalrank from
	(select a.store_id,sum(a.total) as salestotal 
		FROM(SELECT s.store_id,sum(s.store_sales) as total FROM sales_fact_1998 s GROUP BY s.store_id
			 UNION ALL
			 SELECT s.store_id,sum(s.store_sales) as total FROM sales_fact_dec_1998 s GROUP BY s.store_id) a
		GROUP BY a.store_id)
)where totalrank<=10;
	



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
