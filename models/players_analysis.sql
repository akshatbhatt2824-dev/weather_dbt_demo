select
    initcap(name) as name,
    score,
    playedmatches as matches_played,
    initcap(performance) as performance,
    score * playedmatches as total_points,
    {{ classify_player('score', 'playedmatches') }} as player_category
from PRACTICEDBT.METHODDBT.PLAYERS_DATA
