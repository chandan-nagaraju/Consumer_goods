with cte1 as 
(SELECT p.product_code,p.division,
p.product, sum(sold_quantity) as total_sold_quantity,
row_number() over(partition by p.division order by sum(sold_quantity) )  as rank_order
FROM gdb023.fact_sales_monthly s
join dim_product p 
on s.product_code=p.product_code
where s.fiscal_year=2021
group by p.division,p.product_code)
select * from cte1
where rank_order<=3
order by division, rank_order