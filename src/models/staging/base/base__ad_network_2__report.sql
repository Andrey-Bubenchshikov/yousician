{{ config(materialized='view') }}

WITH source_data AS (

    SELECT * FROM {{ ref('ae_ad_network_2_report') }}

),

rename AS (

    SELECT
        "ID" AS campaign_id,
        "CAMPAIGN_NAME" AS campaign_name,
        "DATE" AS calendar_date,
        "SPEND" AS spend,
        "IMPRESSIONS" AS impressions,
        "CLICKS" AS clicks
    FROM source_data

)

SELECT * FROM rename
