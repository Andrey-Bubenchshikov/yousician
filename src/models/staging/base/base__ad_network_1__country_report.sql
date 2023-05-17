{{ config(materialized='view') }}

WITH source_data AS (

    SELECT * FROM {{ ref('ae_ad_network_1_country_report') }}

),

rename AS (

    SELECT
        "DATE" AS calendar_date,
        "CAMPAIGN_ID" AS campaign_id,
        "COUNTRY_ID" AS country_id,
        "SPEND" AS spend,
        "IMPRESSIONS" AS impressions,
        "CLICKS" AS clicks
    FROM source_data

)

SELECT * FROM rename
