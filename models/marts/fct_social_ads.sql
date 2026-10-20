{{ config(materialized='table') }}


WITH facebook AS (
    SELECT 
        ad_date,
        ad_id,
        campaign_name,
        ad_group_name,
        ad_name,
        ad_currency_code,
        CAST(spend AS DECIMAL(18,2)) AS spend,
        CAST(impressions AS INT) AS impressions,
        CAST(ad_clicks AS INT) AS ad_clicks,
        data_src
    FROM {{ ref('int_facebook_ads') }}
),

snapchat AS (
    SELECT 
        ad_date,
        ad_id,
        campaign_name,
        ad_group_name,
        ad_name,
        ad_currency_code,
        CAST(spend AS DECIMAL(18,2)) AS spend,
        CAST(impressions AS INT) AS impressions,
        CAST(ad_clicks AS INT) AS ad_clicks,
        data_src
    FROM {{ ref('int_snapchat_ads') }}
)

SELECT * FROM facebook
UNION ALL
SELECT * FROM snapchat
