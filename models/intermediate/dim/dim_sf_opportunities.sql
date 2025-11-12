{{ config(materialized='table') }}

select 
account_name,
opportunity_name,
currency,
opportunity_id,
stage,
closing_date
from {{ ref('stg_sf__opportunities') }}
