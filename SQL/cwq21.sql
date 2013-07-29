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




