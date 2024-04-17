{{ 
    config(
        materialized='table'
    )
}}

with mergedata as (
    select *
    from {{ ref('stg_mergedata_19') }}
), 
studydata as (
    select *
    from {{ ref('stg_studydata_19') }}
)
select
    mergedata.collegeid,
    mergedata.instnm,
    mergedata.city,
    mergedata.stabbr,
    mergedata.main,
    mergedata.numbranch,
    mergedata.preddeg,
    mergedata.degree_type_description,
    mergedata.highdeg,
    mergedata.control,
    mergedata.st_fips,
    mergedata.adm_rate,
    mergedata.adm_rate_all,
    mergedata.sat_avg,
    mergedata.sat_avg_all,
    studydata.distance
from mergedata
inner join studydata on mergedata.unitid = studydata.unitid