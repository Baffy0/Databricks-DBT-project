{{ config(materialized='view') }}


with raw_source as (
    select * from {{ source('raw_files', 'raw_snapchat_ads_stats') }}
)


SELECT
    ad_detail_id,
    ad_currency_code,
    ad_country,
    CAST(ad_spend AS DECIMAL(10,2)) AS spend,

    CAST(
        CASE
            WHEN TRIM(ad_impressions) = 'null' THEN '0'
            ELSE ad_impressions
        END AS INT
    ) AS impressions,

    CAST(
        CASE
            WHEN TRIM(ad_clicks) = 'null' THEN '0'
            ELSE ad_clicks
        END AS INT
    ) AS ad_clicks,

    CAST(ad_date AS DATE) AS ad_date,

    data_src

FROM raw_source
