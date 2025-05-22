select * from {{ ref("stg_jaffle_shop__customers") }}
where last_name not like '%.'