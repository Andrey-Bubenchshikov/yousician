{{ config(materialized='table', sort=['calendar_date', 'campaign_id']) }}

WITH ad_reports AS (

{{
        dbt_utils.union_relations(
            relations=[
                ref('stg__ad_network_1__report'),
                ref('base__ad_network_2__report')
                ],
            source_column_name=None
            )
    }}

)

SELECT
    calendar_date,
    campaign_id,
    campaign_name,
    country_code,
    country_name,
    country_type,
    state_name,
    state_type,
    spend,
    impressions,
    clicks
FROM ad_reports
