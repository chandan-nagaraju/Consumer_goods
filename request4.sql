with cte1 as (
SELECT p.segment,count(p.product) as product_count_2020
FROM gdb023.fact_sales_monthly s
join dim_product p
on s.product_code=p.product_code
where s.fiscal_year=2020
group by segment
),
cte2 as (SELECT p.segment,count(p.product) as product_count_2021
FROM gdb023.fact_sales_monthly s
join dim_product p
on s.product_code=p.product_code
where s.fiscal_year=2021
group by segment
)
select c1.segment,c1.product_count_2020,c2.product_count_2021,
(c2.product_count_2021-c1.product_count_2020) as difference 
from cte1 as c1
join cte2 as c2
on c1.segment = c2.segment
group by segment
order by difference desc;