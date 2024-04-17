{{ 
    config(
        materialized='table'
    )
}}

with merged_data as (
    select *
    from {{ ref('stg_merged_data_1920') }}
), 
studydata as (
    select *
    from {{ ref('stg_studydata_1920') }}
)
select
    merged_data.collegeid,
    merged_data.instnm,
    merged_data.city,
    merged_data.stabbr,
    merged_data.main,
    merged_data.numbranch,
    merged_data.preddeg,
    merged_data.degree_type_description,
    merged_data.highdeg,
    merged_data.control,
    merged_data.st_fips,
    merged_data.adm_rate,
    merged_data.adm_rate_all,
    merged_data.sat_avg,
    merged_data.sat_avg_all,
    studydata.distance
from merged_data
inner join studydata on merged_data.unitid = studydata.unitid