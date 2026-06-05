select
    initcap(name) as name,
    score,
    matches_played,
    total_points,
    player_category,

    case
        when total_points >= 60 then 100
        when total_points >= 50 then 50
        when total_points >= 40 then 30
        else 20
    end as reward_amount

from {{ ref('players_analysis') }}
WHERE player_category ='Elite'

order by reward_amount desc, total_points desc