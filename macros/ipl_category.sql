{% macro classify_stadium(matches_held) %}

CASE
    WHEN {{ matches_held }} >= 80 THEN 'PREMIUM'
    WHEN {{ matches_held }} >= 50 THEN 'POPULAR'
    ELSE 'REGULAR'
END

{% endmacro %}