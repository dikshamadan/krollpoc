{{ config(materialized='table') }}

select 
opportunity_id,
account_id,
amount,
closed,
won
from {{ ref('stg_sf__opportunities') }}
