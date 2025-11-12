{{ config(materialized='table') }}

select 
contact_id,
last_activity,
last_modified_date,
account_id,
activity_id
from {{ ref('stg_sf__contact_activities') }}
