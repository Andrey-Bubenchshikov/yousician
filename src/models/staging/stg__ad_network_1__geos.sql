WITH geo AS (

    SELECT * FROM {{ ref('base__ad_network_1__geo_dictionary') }}

),

remove_nones AS (

    SELECT *
    FROM geo
    WHERE country_code != 'None'

)

SELECT * FROM remove_nones
