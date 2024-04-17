{#
    This macro returns the description of the  
    school.degrees_awarded.predominant:
    source: PREDDEG
    type: integer
    description: |-
      Predominant undergraduate degree awarded
       0 Not classified
       1 Predominantly certificate-degree granting
       2 Predominantly associate's-degree granting
       3 Predominantly bachelor's-degree granting
       4 Entirely graduate-degree granting
    index: tinyint
#}

{% macro get_degree_type_description(preddeg) -%}

    case {{ dbt.safe_cast("preddeg", api.Column.translate_type("integer")) }}  
        when 0 then 'Not classified'
        when 1 then 'Predominantly certificate-degree granting'
        when 2 then 'Predominantly associate-degree granting'
        when 3 then 'Predominantly bachelor-degree granting'
        when 4 then 'Entirely graduate-degree granting'
        else 'EMPTY'
    end

{%- endmacro %}