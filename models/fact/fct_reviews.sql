{{
    config(
        materialized='incremental',
        on_schema_change='fail'
    )
}}

with fct_reviews as
(
    select * from {{ ref("src_reviews") }}
)

select
    listing_id
    ,review_date as review_timestamp
    ,reviewer_name
    ,comments as review_text
    ,sentiment
from fct_reviews
where comments is not null
{% if is_incremental() %}
  and review_date > (select max(review_date) from fct_reviews)
{% endif %}