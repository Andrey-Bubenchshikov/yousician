{{ config(materialized='view') }}

WITH source_data AS (

    SELECT * FROM {{ ref('ae_ad_network_1_campaign_updates') }}

),

rename AS (

    SELECT
        "CAMPAIGN_ID" AS campaign_id,
        "UPDATE_DATE" AS update_date,
        "NAME" AS campaign_name
    FROM source_data

)

SELECT * FROM rename
