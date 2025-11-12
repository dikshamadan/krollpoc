{{ config(materialized='table') }}

select *
from {{ ref('stg_sf__accounts') }}