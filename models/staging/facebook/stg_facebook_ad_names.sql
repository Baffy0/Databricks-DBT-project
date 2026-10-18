{{config (materialized = 'view')}}

with raw_source as (
    select * from {{source('raw_files','raw_facebook_ad_names')}}
)

select * from raw_source 

