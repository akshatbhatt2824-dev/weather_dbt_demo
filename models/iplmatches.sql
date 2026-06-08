select
    initcap(city) as city,
    initcap(stadium) as stadium,
    matches_held,
    wining_team,
    totalmatcheswon,

    {{ classify_stadium('matches_held') }}
        as stadium_category,

    round(
        (totalmatcheswon * 100.0) /
        matches_held,
        2
    ) as winning_percentage

from STADIUM.MYGROUND.IPLMATCHES