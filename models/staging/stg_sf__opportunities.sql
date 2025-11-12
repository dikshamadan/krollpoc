{{ config(materialized='view') }}

select 
Account_Name as account_name,
Opportunity_Name as opportunity_name,
Amount_Currency as currency,
Amount as amount,
Opportunity_ID as opportunity_id,
Account_ID as account_id,
Stage as stage,
Closing_Date as closing_date,
Closed as closed,
Won as won
from {{ source('kroll_volume', 'sf_opportunities') }}
