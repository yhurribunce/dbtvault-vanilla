{%- set yaml_metadata -%}
source_model: 'raw_nation'
derived_columns:
    NATION_KEY: 'N_NATIONKEY'
    NATION_NAME: 'N_NAME'
    REGION_KEY: 'N_REGIONKEY'
    RECORD_SOURCE: '!TPCH_SF10-NATION'
    LOAD_DATETIME: 'current_date'
    EFFECTIVE_FROM: "TO_DATE('{{ var('load_date') }}')"
hashed_columns:
    NATION_PK: 'NATION_KEY'
    NATION_HASHDIFF:
      is_hashdiff: true
      columns:
          - 'NATION_KEY'
          - 'NATION_NAME'
          - 'REGION_KEY'
      
{%- endset -%}

{% set metadata_dict = fromyaml(yaml_metadata) %}

{% set source_model = metadata_dict['source_model'] %}

{% set derived_columns = metadata_dict['derived_columns'] %}

{% set hashed_columns = metadata_dict['hashed_columns'] %}

{{ dbtvault.stage(include_source_columns=true,
                  source_model=source_model,
                  derived_columns=derived_columns,
                  hashed_columns=hashed_columns) }}
