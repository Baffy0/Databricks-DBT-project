{{ config(materialized='table') }}

WITH fs AS (
    SELECT *
    FROM {{ ref('stg_facebook_ads_stats') }}
),

fn AS (
    SELECT *
    FROM {{ ref('stg_facebook_ad_names') }}
),

fg AS (
    SELECT *
    FROM {{ ref('stg_facebook_ad_group') }}
),

fc AS (
    SELECT *
    FROM {{ ref('stg_facebook_campaign') }}
),

fa AS (
    SELECT *
    FROM {{ ref('stg_facebook_new_account') }}
)

select 
fs.ad_date,
fs.ad_id,
fc.campaign_name,
fg.ad_group_name,
fn.ad_name,
fa.ad_currency_code,
fs.spend,
fs.impressions,
fs.ad_clicks,
'facebook' as data_src
from stg_facebook_ads_stats fs
left join stg_facebook_new_account fa
on fs.account_id = fa.account_id
left join stg_facebook_ad_names fn
on fa.account_id = fn.account_id
left join stg_facebook_ad_group fg
on fn.ad_group_id = fg.ad_group_id
left join stg_facebook_campaign fc
on fn.campaign_id = fc.campaign_id