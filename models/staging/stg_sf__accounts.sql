{{ config(materialized="view") }}

select
    account_name as account_name,
    account_id as account_id,
    website as website,
    industry as industry,
    parent_account as parent_account,
    parent_account_id as parent_account_id
from {{ source("kroll_volume", "sf_accounts") }}
