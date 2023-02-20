WITH 
unique_products_2020 AS (
  SELECT COUNT(DISTINCT product) AS count
  FROM dim_product p
  join fact_sales_monthly s
  on p.product_code=s.product_code
  WHERE s.fiscal_year = 2020
),
unique_products_2021 AS (
  SELECT COUNT(DISTINCT product) AS count
  FROM dim_product p
  join fact_sales_monthly s
  on p.product_code=s.product_code
  WHERE s.fiscal_year = 2021
)
SELECT unique_products_2020.count AS unique_products_2020, 
       unique_products_2021.count AS unique_products_2021,
       ((unique_products_2021.count - unique_products_2020.count) / unique_products_2020.count) * 100 AS percentage_chg
FROM unique_products_2020, unique_products_2021;