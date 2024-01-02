*** Settings ***
Resource    imports.resource

*** Variables ***
${APP_URL}  ${base_url}
${PAGE}     2
${HTTP_SESSION}  ${NONE}
${HTTP_METHOD}   ${NONE}
${HEADER}   ${NONE}
${BODY}     ${NONE}
${HTTP_RESPONSE}     ${NONE}

*** Keywords ***
I use the base URL
    ${HTTP_SESSION}  create session  mysession   ${APP_URL}   disable_warnings=1    verify=false
    set test variable    ${HTTP_SESSION}
    RETURN    ${HTTP_SESSION}

I set the header "${header_key}" as "${header_value}"
    ${HEADER}  create dictionary  ${header_key}=${header_value}
    set test variable    ${HEADER}
    RETURN    ${HEADER}

I set the HTTP method as "${httpMethod}"
    set test variable    ${HTTP_METHOD}     ${httpMethod}
    RETURN    ${HTTP_METHOD}

I set the request body from file "${file_name}"
    ${BODY}     Load JSON From File    Resources/Data/${file_name}
    set test variable    ${BODY}
    RETURN    ${BODY}

I make an HTTP request with path as "${path}"
    IF  $HTTP_METHOD == "get"
        ${HTTP_RESPONSE}    run keyword and continue on failure
        ...     get on session  mysession  ${path}  headers=${HEADER}   expected_status=any
    ELSE IF     $HTTP_METHOD == "post"
        ${HTTP_RESPONSE}    run keyword and continue on failure
        ...     post on session  mysession  ${path}  headers=${HEADER}  json=${BODY}   expected_status=any
    ELSE IF     $HTTP_METHOD == "put"
        ${HTTP_RESPONSE}    run keyword and continue on failure
        ...     put on session  mysession  ${path}  headers=${HEADER}  json=${BODY}   expected_status=any
    ELSE
        ${HTTP_RESPONSE}    run keyword and continue on failure
        ...     delete on session  mysession  ${path}  headers=${HEADER}   expected_status=any
    END
    set test variable    ${HTTP_RESPONSE}
    RETURN    ${HTTP_RESPONSE}

I make an HTTP request with path as "${path}" and query string as "${query_string}"
    IF  $HTTP_METHOD == "get"
        ${HTTP_RESPONSE}    run keyword and continue on failure
        ...     get on session  mysession  ${path}?${query_string}  headers=${HEADER}   expected_status=any
    ELSE IF     $HTTP_METHOD == "post"
        ${HTTP_RESPONSE}    run keyword and continue on failure
        ...     post on session  mysession  ${path}?${query_string}  headers=${HEADER}  json=${BODY}   expected_status=any
    ELSE IF     $HTTP_METHOD == "put"
        ${HTTP_RESPONSE}    run keyword and continue on failure
        ...     put on session  mysession  ${path}?${query_string}  headers=${HEADER}  json=${BODY}   expected_status=any
    ELSE
        ${HTTP_RESPONSE}    run keyword and continue on failure
        ...     delete on session  mysession  ${path}?${query_string}  headers=${HEADER}   expected_status=any
    END
    set test variable    ${HTTP_RESPONSE}
    RETURN    ${HTTP_RESPONSE}
