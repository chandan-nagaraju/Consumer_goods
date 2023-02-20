select *
from (SELECT mc.product_code, dp.product,mc.manufacturing_cost FROM gdb023.fact_manufacturing_cost as mc
join dim_product dp
on mc.product_code=dp.product_code
order by mc.manufacturing_cost desc
limit 5) as max_cost
union
select *
from (SELECT mc.product_code, dp.product,mc.manufacturing_cost FROM gdb023.fact_manufacturing_cost as mc
join dim_product dp
on mc.product_code=dp.product_code
order by mc.manufacturing_cost 
limit 5) as min_cost;
