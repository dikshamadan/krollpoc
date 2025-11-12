{{ config(materialized='view') }}

select 
Subject as subject,
Campaign_Name as campaign_name,
Activity_ID as activity_id,
Closed as closed
from {{ source('kroll_volume', 'sf_campaign_activities') }}
