{{ config(materialized='table') }}

select distinct
    session_id,
    Session_campaign,
    Session_source___medium,
    event_name,
    page_location,
    page_referrer
from {{ ref('stg_ga4__data')}}
