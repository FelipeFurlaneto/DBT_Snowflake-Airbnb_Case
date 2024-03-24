{{
    config(
        materialized='view'
    )
}}

with dim_hosts as
(
    select * from {{ ref("src_hosts") }}
)

select
    host_id
    ,NVL(
        host_name,
        'Anonymous'
    ) as host_name
    ,is_superhost
    ,created_at::DATE as created_at
    ,updated_at::DATE as updated_at
from dim_hosts