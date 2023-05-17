WITH campaigns AS (

    SELECT * FROM {{ ref('base__ad_network_1__campaign_updates') }}

),

keep_unique_campaign_id_name AS (

    SELECT
        campaign_id,
        campaign_name
    FROM campaigns
    GROUP BY 1, 2

)

SELECT * FROM keep_unique_campaign_id_name
