
{{ config(materialized='table') }}

WITH ss AS (
    SELECT *
    FROM {{ ref('stg_snapchat_ads_stats') }}
),

sn AS (
    SELECT *
    FROM {{ ref('stg_snapchat_ad_names') }}
),

sg AS (
    SELECT *
    FROM {{ ref('stg_snapchat_ad_group') }}
),

sc AS (
    SELECT *
    FROM {{ ref('stg_snapchat_ads_campaign') }}
)

SELECT
    ss.ad_date,
    ss.ad_detail_id AS ad_id,
    sc.campaign_name,
    sg.ad_group_name,
    sn.ad_name,
    ss.ad_currency_code,
    ss.spend,
    ss.impressions,
    ss.ad_clicks,
    ss.data_src
FROM ss
LEFT JOIN sn
    ON ss.ad_detail_id = sn.ad_id
LEFT JOIN sg
    ON sn.ad_group_id = sg.ad_group_id
LEFT JOIN sc
    ON sg.campaign_id = sc.campaign_id

