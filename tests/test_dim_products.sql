with validation as (
    select count(sk_product) as qtd
    from {{ ref('dim_products') }}
    group by sk_product
)

select * from validation 
where 1 = 2