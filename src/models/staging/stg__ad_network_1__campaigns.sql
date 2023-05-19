WITH campaigns AS (

    SELECT * FROM {{ ref('base__ad_network_1__campaign_updates') }}

),

keep_unique_campaign_id_name AS (

    -- for now unique combination work, but there could be an update that changes campaign name
    -- if that were to happen test for uniqueness would fail and model would have to keep the latest
    -- changes to campaign name
    SELECT
        campaign_id,
        campaign_name
    FROM campaigns
    GROUP BY 1, 2

)

SELECT * FROM keep_unique_campaign_id_name
