{{ config(materialized='table') }}

select distinct
    session_id,        
    user_pseudo_id,
   
    engagement_time_msec
   
from {{ ref('stg_ga4__data')}}