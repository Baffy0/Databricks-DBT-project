{{ config(materialized='view') }}

with raw_source as (
    select * from {{ source('raw_files', 'raw_snapchat_ad_group') }}
)

Select 
_surrogate_key,
ad_group_id,
campaign_id,
ad_group_name,
CAST(ad_group_updated_at as TIMESTAMP_NTZ) AS ad_group_updated_at
from raw_source