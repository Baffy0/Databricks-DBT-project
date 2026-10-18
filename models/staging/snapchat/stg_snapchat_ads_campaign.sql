{{config(materialized='view')}}

with raw_source as (
    select * from {{source('raw_files','raw_snapchat_ads_campaign')}}
)

select * from raw_source