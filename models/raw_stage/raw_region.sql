select
r_regionkey,
r_name,
r_comment
from {{ source('tpch_sample', 'REGION') }}
