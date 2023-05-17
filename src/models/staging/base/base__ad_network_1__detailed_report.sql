{{ config(materialized='table') }}

WITH source_data AS (

    SELECT * FROM {{ ref('ae_ad_network_1_detailed_report') }}

),

rename AS (

    SELECT *
    FROM source_data

)

SELECT * FROM rename