{% macro classify_player(score, matches) %}

case
    when ({{ score }} * {{ matches }}) >= 60 then 'Elite'
    when ({{ score }} * {{ matches }}) >= 40 then 'Good'
    else 'Average'
end

{% endmacro %}