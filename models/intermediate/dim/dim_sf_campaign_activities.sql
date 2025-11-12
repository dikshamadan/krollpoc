{{ config(materialized='table') }}

select 
subject,
campiagn_name,
activity_id
from {{ ref('stg_sf__campaign_activities') }}