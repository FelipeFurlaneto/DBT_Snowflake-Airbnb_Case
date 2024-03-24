{{
    config(
        materialized='table'
    )
}}

with hosts as
(
    select * from {{ ref("dim_hosts_cleansed") }}
),

listings as
(
    select * from {{ ref("dim_listings_cleansed") }}
)

select
    h.host_id as host_id
    ,h.host_name as host_name
    ,h.is_superhost as is_superhost
    ,h.created_at as host_dt_creation
    ,h.updated_at as host_dt_update
    ,l.listing_id as listing_id
    ,l.listing_name as listing_name
    ,l.room_type as room_type
    ,l.minimum_nights as minimum_nights
    ,l.room_id as room_id
    ,l.price as price
    ,l.created_at as listing_dt_creation
    ,l.updated_at as listing_dt_update
from hosts h
inner join listings l on h.host_id = l.host_id