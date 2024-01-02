*** Settings ***
Resource    ../../../Keywords/API/HTTPStepDefs.resource
Resource    ../../../Keywords/API/ResponseValidation.resource

Suite Setup     log     Suite Setup...
Suite Teardown     log     Suite Teardown...
Test Setup     log     Test Setup...
Test Teardown     log     Test Teardown...

*** Test Cases ***
Delete a User
    [Documentation]    This test case is to test delete a User
    [Tags]  Smoke   User
    Given I use the base URL
    When I set the header "Content-Type" as "application/json"
    And I set the HTTP method as "delete"
    And I make an HTTP request with path as "api/users/2"
    Then response status should be equal to "204"
