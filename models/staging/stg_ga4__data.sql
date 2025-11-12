{{ config(materialized='view') }}

select *
from {{ source('kroll_volume', 'ga4_data') }}
