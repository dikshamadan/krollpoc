{{ config(materialized='table') }}

select 
activity_id,
closed
from {{ref('stg_sf__campaign_activities') }}
