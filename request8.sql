SELECT 
case 
	when extract(Month from date) between 3 and 5 then 1
    when extract(Month from date) between 6 and 8 then 2
    when extract(Month from date) between 9 and 11 then 3
    else 4
    End as quarter,
    sold_quantity
FROM gdb023.fact_sales_monthly
where fiscal_year=2020
group by quarter
order by quarter desc;