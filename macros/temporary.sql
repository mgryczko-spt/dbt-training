select
    *
 {# first_name, #}
 {# count(*) as count #}
from
    {# {{ ref("stg_jaffle_shop__customers") }} #}
{# group by first_name #}
{# having count > 1 #}
{# where last_name like '%.' #}
{# right outer join {{ ref("dim_customers") }} #}
{# on {{ ref("stg_jaffle_shop__customers") }}.customer_id = {{ ref("dim_customers") }}.customer_id #}
{# union #}
{# select #}
    {# * #}
 {# first_name, #}
 {# count(*) as count #}
{# from #}
    {# {{ ref("stg_jaffle_shop__customers") }} #}
{{ dbt_utils.union_relations(
    relations=[
        ref("stg_jaffle_shop__customers"),
        ref("dim_customers")
    ]
) }}
{# group by first_name #}
{# having count > 1 #}
{# where last_name like '%.' #}