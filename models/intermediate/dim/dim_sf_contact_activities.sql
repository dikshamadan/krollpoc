{{ config(materialized='table') }}

select 
subject,
first_name,
last_name,
contact_id
from {{ ref('stg_sf__contact_activities') }}
