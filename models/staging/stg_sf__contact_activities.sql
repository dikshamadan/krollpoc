{{ config(materialized='view') }}

select 
Subject as subject,
First_Name as first_name,
Last_Name as last_name,
Contact_ID as contact_id,
`Contact:_Last_Activity` as last_activity,
Contact_Owner as contact_owner,
Account_ID as account_id,
Last_Modified_Date as last_modified_date,
Activity_ID as activity_id
from {{ source('kroll_volume', 'sf_contact_activities') }}
