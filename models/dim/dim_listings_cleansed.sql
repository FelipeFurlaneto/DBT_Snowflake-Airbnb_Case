{{
    config(
        materialized='view'
    )
}}

with dim_listings as
(
    select * from {{ ref("src_listing")}}
)

select
    listing_id
    ,listing_name
    ,room_type
    ,   case 
            when minimum_nights = 0
            then 1
            else minimum_nights
        end
    as minimum_nights
    ,replace(
        listing_url,
        'https://www.airbnb.com/rooms/'
    ) as room_id
    ,host_id
    ,replace(
        price_str,
        '$'
    )::NUMBER(10,2) as price
    ,created_at::DATE as created_at
    ,updated_at::DATE as updated_at
from dim_listings