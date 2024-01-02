*** Settings ***
Library    SeleniumLibrary
Library    ../../../Libs/testlib.py

Suite Setup
Suite Teardown

Test Setup
Test Teardown

*** Variables ***
${BROWSER}  =   chrome

*** Test Cases ***
Should be able to login successfully
    [Documentation]         Should be able to login successfully
    [Tags]                  Smoke   Login
    log to console    Hello, Login Successful to ${BASE_URL}!
    log to console    encode_url(${BASE_URL}/login?username=araj&pwd=araj)
