select *
from STADIUM.MYGROUND.IPLMATCHES
where matches_held >= {{ var('min_matches',60) }}