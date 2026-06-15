{% macro mulesoft_dbt_process_log(
    action,
    parent_process_name,
    child_process_name=None,
    processed_by=None,
    correlation_id=None,
    input_row_count=None,
    inserted_count=None,
    updated_count=None,
    error_count=None,
    retry_count=None,
    status_desc=None,
    error_reason=None
) %}

    {% set sql %}

        insert into PROCESS_LOG_AUDIT
        (
            ACTION,
            PARENT_PROCESS_NAME,
            CHILD_PROCESS_NAME,
            PROCESSED_BY,
            CORRELATION_ID,
            INPUT_ROW_COUNT,
            INSERTED_COUNT,
            UPDATED_COUNT,
            ERROR_COUNT,
            RETRY_COUNT,
            STATUS_DESC,
            ERROR_REASON,
            CREATED_TS
        )
        values
        (
            '{{ action }}',
            '{{ parent_process_name }}',
            '{{ child_process_name }}',
            '{{ processed_by }}',
            '{{ correlation_id }}',
            {{ input_row_count if input_row_count else 'null' }},
            {{ inserted_count if inserted_count else 'null' }},
            {{ updated_count if updated_count else 'null' }},
            {{ error_count if error_count else 'null' }},
            {{ retry_count if retry_count else 'null' }},
            '{{ status_desc }}',
            '{{ error_reason }}',
            current_timestamp()
        )

    {% endset %}

    {% do run_query(sql) %}

{% endmacro %}