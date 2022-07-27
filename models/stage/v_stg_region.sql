{%- set yaml_metadata -%}
source_model: 'raw_region'
derived_columns:
    REGION_KEY: 'R_REGIONKEY'
    REGION_NAME: 'R_NAME'
    RECORD_SOURCE: '!TPCH_SF10-REGION'
    LOAD_DATETIME: 'current_date'
    EFFECTIVE_FROM: "TO_DATE('{{ var('load_date') }}')"
hashed_columns:
    REGION_PK: 'REGION_KEY'
    REGION_HASHDIFF:
        is_hashdiff: true
        columns:
          - 'REGION_KEY'
          - 'REGION_NAME'

{%- endset -%}

{% set metadata_dict = fromyaml(yaml_metadata) %}

{% set source_model = metadata_dict['source_model'] %}

{% set derived_columns = metadata_dict['derived_columns'] %}

{% set hashed_columns = metadata_dict['hashed_columns'] %}

{{ dbtvault.stage(include_source_columns=true,
                  source_model=source_model,
                  derived_columns=derived_columns,
                  hashed_columns=hashed_columns) }}
