*** Settings ***
Resource    ../../../Keywords/API/HTTPStepDefs.resource
Resource    ../../../Keywords/API/ResponseValidation.resource

Suite Setup     log     Suite Setup...
Suite Teardown     log     Suite Teardown...
Test Setup     log     Test Setup...
Test Teardown     log     Test Teardown...

*** Test Cases ***
List Users with page number
    [Documentation]    This test case is to test List Users with page number
    [Tags]  Smoke   User
    Given I use the base URL
    When I set the header "Content-Type" as "application/json"
    And I set the HTTP method as "get"
    And I make an HTTP request with path as "api/users" and query string as "page=${page}"
    Then response status should be equal to "200"

List User with ID
    [Documentation]    This test case is to test List User with ID
    [Tags]  Smoke   User
    Given I use the base URL
    When I set the header "Content-Type" as "application/json"
    And I set the HTTP method as "get"
    And I make an HTTP request with path as "api/users/2"
    Then response status should be equal to "200"
    And response body should contain json with key as "first_name" and value as "Janet"
    And response header should contain header with key as "Content-Type" and value as "application/json; charset=utf-8"

User Not Found with ID
    [Documentation]    This test case is to test User Not Found with ID
    [Tags]  Smoke   User
    Given I use the base URL
    When I set the header "Content-Type" as "application/json"
    And I set the HTTP method as "get"
    And I make an HTTP request with path as "api/users/23"
    Then response status should be equal to "404"
    And response header should contain header with key as "Content-Type" and value as "application/json; charset=utf-8"
