{{ config(materialized='table') }}

select 
subject,
campaign_name,
activity_id
from {{ ref('stg_sf__campaign_activities') }}