{{ config(materialized='table') }}

WITH source_data AS (

    SELECT * FROM {{ ref('ae_ad_network_2_report') }}

),

rename AS (

    SELECT *
    FROM source_data

)

SELECT * FROM rename
