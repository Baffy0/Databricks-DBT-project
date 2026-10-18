{{config(materialized = 'view')}}

with raw_source as (
    select * from {{source('raw_files','raw_facebook_campaign')}}
)

select 
campaign_id,
campaign_name,
CAST(campaign_updated_at as TIMESTAMP_NTZ) AS campaign_updated_at
from raw_source