*** Settings ***
Resource    imports.resource

*** Keywords ***
response status should be equal to "${statusCode}"
    ${stsCode}  convert to string  ${HTTP_RESPONSE.status_code}
    run keyword and continue on failure     should be equal  ${stsCode}     ${statusCode}

response body should contain json with key as "${key}" and value as "${value}"
    ${BODY}     convert to string   ${HTTP_RESPONSE.content}
    run keyword and continue on failure    should contain  ${BODY}     ${key}
    run keyword and continue on failure    should contain  ${BODY}     ${value}

response header should contain header with key as "${key}" and value as "${value}"
    log to console      ${HTTP_RESPONSE.headers}
    ${contentTypeValue}     get from dictionary  ${HTTP_RESPONSE.headers}     ${key}
    run keyword and continue on failure     should be equal   ${contentTypeValue}   ${value}
