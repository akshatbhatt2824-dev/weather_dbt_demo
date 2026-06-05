select
    initcap(name) as name,
    score,
    initcap(playedmatches) as matches_played,
    score * playedmatches as total_points
from PRACTICEDBT.METHODDBT.PLAYERS_DATA
where score * playedmatches >=40
order by total_points desc

