*** Settings ***
Documentation    Test case with signup scenarios
Resource    ../resources/signup.resource
Suite Setup    Setup
Suite Teardown    Close All Browsers

*** Test Cases ***
Scenario 1: User successfully creates an AutomationPractice Account
    [Documentation]   Check if a registration happens succesfully when the
    ...               user fill all the require fields and send the form.
    [Tags]    CN01    TC00
    Given The User Is On The AutomationPractice Registration Page
    When He Enters All Required Registration Fields
    Then an AutomationPractice account is created