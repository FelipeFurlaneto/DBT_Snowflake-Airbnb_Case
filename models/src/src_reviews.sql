{{
    config(
        materialized='ephemeral'
    )
}}

with src_reviews as
(
    select * from {{ source('airbnb', 'reviews') }}
)

select
    listing_id
    ,date as review_date
    ,reviewer_name
    ,comments
    ,sentiment
from src_reviews