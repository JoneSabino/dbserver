*** Settings ***
Documentation     Asserts if the login error are properly displayed in different situations.
Resource          ../resources/signup.resource
Suite Setup       Create Chrome WebDriver
Suite Teardown    Close All Browsers
Test Template     Scenario: Login with invalid credentials should fail

*** Variables ***
${VALID USER}     benjaminmontgomery@example.org
${VALID PASSWORD}    a+8sGOo&D^

*** Test Cases ***    USERNAME         PASSWORD
Invalid User Name     invalid          ${VALID PASSWORD}

Invalid Password      ${VALID USER}    invalid

Invalid User Name and Password
                      invalid          invalid

Empty User Name       ${EMPTY}         ${VALID PASSWORD}

Empty Password        ${VALID USER}    ${EMPTY}

Empty User Name and Password
                      ${EMPTY}         ${EMPTY}

*** Keywords ***
Scenario: Login With Invalid Credentials Should Fail
    [Documentation]    Navigates to the login page and
    ...    assert form behavior in case of errors.
    [Arguments]    ${USER}    ${PASSWORD}
    Go To Login Page
    Input    ${LOGIN_EMAIL}    ${USER}
    Input    ${LOGIN_PASSWORD}    ${PASSWORD}    passwd=True
    Click In    ${LOGINSUBMIT_BTN}
    Wait Until Element Is Visible    ${RED_FLAG}    1s
