{{config(materialized = 'view')}}

with raw_sources as(
    select * from {{source('raw_files','raw_facebook_new_account')}}
)

select 
account_id,
account_name,
ad_currency_code,
CAST(account_created_at as TIMESTAMP_NTZ) AS account_created_at,
CAST(account_updated_at as TIMESTAMP_NTZ) AS account_updated_at

from raw_sources