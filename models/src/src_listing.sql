{{
    config(
        materialized='ephemeral'
    )
}}

with src_listing as
(
    select * from {{ source('airbnb', 'listings')}}
)

select
ID as listing_id
,NAME as listing_name
,listing_url
,room_type
,minimum_nights
,host_id
,price as price_str
,created_at
,updated_at
from src_listing