{% macro format_currency(value) %}
    COALESCE(CAST({{ value }} AS STRING), '0') || ' USD'
{% endmacro %}
