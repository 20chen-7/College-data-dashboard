with 

studydata as (

    select * from {{ source('staging', 'studydata_1920') }}

),

renamed as (

    select
        unitid,
        opeid6,
        instnm,
        control,
        main,
        cipcode,
        cipdesc,
        credlev,
        creddesc,
        ipedscount1,
        ipedscount2,
        distance,
        __index_level_0__

    from studydata

)

select * from renamed

-- dbt build --select <model_name> --vars '{'is_test_run': 'false'}'
{% if var('is_test_run', default=true) %}

  limit 100

{% endif %}
