

SELECT 
s.date,
s.fiscal_year,
round(s.sold_quantity*p.gross_price,2) as gross_sales_amount
FROM gdb023.fact_sales_monthly s
join fact_gross_price p
on s.product_code=p.product_code
join dim_customer c
on s.customer_code= c.customer_code
where c.customer='Atliq Exclusive'
group by s. date
order by s.fiscal_year;