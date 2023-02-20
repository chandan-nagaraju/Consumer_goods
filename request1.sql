SELECT customer, market 
FROM gdb023.dim_customer
where 
	region='APAC' and
	customer='Atliq Exclusive'
group by 
	market,customer
order by
	market 
;