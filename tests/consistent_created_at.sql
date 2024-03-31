select * from {{ ref('fct_reviews') }} f
left join {{ ref('dim_listings_cleansed') }} l
using (listing_id)
where l.created_at > date(f.review_timestamp)