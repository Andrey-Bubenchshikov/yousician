WITH report AS (

    {{
        dbt_utils.union_relations(
            relations=[
                ref('base__ad_network_1__detailed_report'),
                ref('base__ad_network_1__country_report')
            ]
        )
    }}

),

campaigns AS (

    SELECT * FROM {{ ref('stg__ad_network_1__campaigns') }}

),

geos AS (

    SELECT * FROM {{ ref('stg__ad_network_1__geos') }}

),

add_campaign_name AS (

    SELECT
        report.campaign_id,
        report.calendar_date,
        report.country_id,
        report.state_id,
        report.spend,
        report.impressions,
        report.clicks,
        campaigns.campaign_name
    FROM report
    LEFT JOIN campaigns
        ON report.campaign_id = campaigns.campaign_id

),

add_geo_dimensions AS (

    SELECT
        add_campaign_name.calendar_date,
        add_campaign_name.campaign_id,
        add_campaign_name.campaign_name,
        add_campaign_name.country_id,
        add_campaign_name.state_id,
        add_campaign_name.spend,
        add_campaign_name.impressions,
        add_campaign_name.clicks,
        geos.country_code,
        geos.country_name,
        geos.location_type
    FROM add_campaign_name
    LEFT JOIN geos
        ON add_campaign_name.country_id = geos.country_id

)

SELECT * FROM add_geo_dimensions
