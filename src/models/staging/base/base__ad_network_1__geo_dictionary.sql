{{ config(materialized='view') }}

WITH source_data AS (

    SELECT * FROM {{ ref('ae_ad_network_1_geo_dictionary') }}

),

rename AS (

    SELECT
        "ID" AS country_id,
        "COUNTRY_CODE" AS country_code,
        "NAME" AS country_name,
        "LOCATION_TYPE" AS location_type
    FROM source_data

)

SELECT * FROM rename
