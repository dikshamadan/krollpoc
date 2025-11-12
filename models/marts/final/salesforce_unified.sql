{{ config(materialized='table') }}

with opportunities as (
    select 
        fct.opportunity_id,
        fct.account_id,
        fct.amount,
        fct.closed,
        fct.won,
        dim_op.opportunity_name,
        dim_op.currency,
        dim_op.stage,
        dim_op.closing_date
    from {{ ref('fact_sf_opportunities') }} fct
    left join {{ ref('dim_sf_opportunities') }} dim_op 
        on fct.opportunity_id = dim_op.opportunity_id
),

contacts as (
    select 
        fct.activity_id,
        fct.contact_id,
        fct.account_id,
        fct.last_activity,
        fct.last_modified_date,
        dim_con.subject,
        dim_con.first_name,
        dim_con.last_name
    from {{ ref('fact_sf_contact_activities') }} fct
    left join {{ ref('dim_sf_contact_activities') }} dim_con
        on fct.contact_id = dim_con.contact_id
),

campaigns as (
    select 
        fct.activity_id,
        fct.closed,
        dim_camp.subject as campaign_subject,
        dim_camp.campaign_name
    from {{ ref('fact_sf_campaign_activities') }} fct
    left join {{ ref('dim_sf_campaign_activities') }} dim_camp
        on fct.activity_id = dim_camp.activity_id
),

accounts as (
    select 
        account_id,
        account_name,
        website,
        industry,
        parent_account,
        parent_account_id
    from {{ ref('dim_sf_accounts') }}
)

select 
    acc.account_id,
    acc.account_name,
    acc.industry,
    acc.website,
    opp.opportunity_id,
    opp.opportunity_name,
    opp.stage,
    opp.amount,
    opp.closed as opportunity_closed,
    opp.won as opportunity_won,
    opp.closing_date,
    con.contact_id,
    con.first_name,
    con.last_name,
    con.last_activity,
    con.last_modified_date,
    camp.activity_id as campaign_activity_id,
    camp.campaign_name,
    camp.campaign_subject,
    camp.closed as campaign_closed
from accounts acc
left join opportunities opp 
    on acc.account_id = opp.account_id
left join contacts con 
    on acc.account_id = con.account_id
left join campaigns camp 
    on con.activity_id = camp.activity_id
