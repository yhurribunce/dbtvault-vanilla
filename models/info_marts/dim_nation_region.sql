select
        link_nat_reg.nation_pk,
        link_nat_reg.region_pk,
        sat_nat.nation_name,
        sat_reg.region_name
        
from {{ ref('link_nation_region') }} as link_nat_reg
inner join {{ ref('sat_nation') }} as sat_nat
on link_nat_reg.nation_pk = sat_nat.nation_pk
inner join {{ ref('sat_region') }} as sat_reg
on link_nat_reg.region_pk = sat_reg.region_pk