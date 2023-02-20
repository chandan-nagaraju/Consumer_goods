with cte1 as (SELECT c.channel,
sold_quantity*gross_price as gross_total_price
 FROM fact_sales_monthly as s
join fact_gross_price as p
on s.product_code=p.product_code
join dim_customer as c
on s.customer_code=c.customer_code
where s.fiscal_year=2021
group by channel)
select *,(gross_total_price*100)/sum(gross_total_price) over() as percentage
from cte1

