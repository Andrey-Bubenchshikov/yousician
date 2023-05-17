{{ config(materialized='table') }}

WITH ad_reports AS (

    {{
        dbt_utils.union_relations(
            relations=[
                ref('stg__ad_network_1__report'),
                ref('base__ad_network_2__report')
                ],
            include=[
                'calendar_date',
                'campaign_id',
                'campaign_name',
                'country_code',
                'country_name',
                'location_type',
                'state_id',
                'spend',
                'impressions',
                'clicks'
            ])
    }}

)

SELECT
    calendar_date,
    campaign_id,
    campaign_name,
    country_code,
    country_name,
    location_type,
    state_id,
    spend,
    impressions,
    clicks
FROM ad_reports
