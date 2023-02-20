-- customer_code 
-- customer 
-- average_discount_percentage

select d.customer_code,c.customer,avg(pre_invoice_discount_pct) over(partition by customer order by customer_code desc) as avg_discount_percentage
from fact_pre_invoice_deductions d
join dim_customer c
on d.customer_code=c.customer_code
where market='India' and fiscal_year=2021
limit 5


