*** Settings ***
Documentation     Keywords related to the signup test case
Resource          locators.resource
Resource          helpers.resource

*** Keywords ***
The User Is On The AutomationPractice Registration Page
    [Documentation]    access the automation practice login page
    Go To Login Page
    Go To Registration Page

He Enters All Required Registration Fields
    [Documentation]    enter all required registration fields
    Select Radio Button    id_gender    1
    Input    ${PERSONAL_INFO.firstname}    ${FAKE_DATA.firstname}    10s
    Input    ${PERSONAL_INFO.lastname}    ${FAKE_DATA.lastname}
    Input    ${PERSONAL_INFO.email}    ${FAKE_DATA.email}
    Input    ${PERSONAL_INFO.passwd}    ${FAKE_DATA.passwd}
    Input Birthdate
    Input    ${PERSONAL_INFO.company}    ${FAKE_DATA.company}
    Input    ${PERSONAL_INFO.address1}    ${FAKE_DATA.address1}
    Input    ${PERSONAL_INFO.city}    ${FAKE_DATA.city}
    Select From List By Value    ${PERSONAL_INFO.state}    1
    Select From List By Value    ${PERSONAL_INFO.country}    21
    Input    ${PERSONAL_INFO.postcode}    ${FAKE_DATA.postcode}
    Input    ${PERSONAL_INFO.phone_mobile}    +5511987654321
    Input    ${PERSONAL_INFO.addr_alias}    ${FAKE_DATA.alias}
    Click In    ${REGISTER_BTN}
    Wait Until Element Is Not Visible    ${REGISTER_BTN}
An AutomationPractice account is created
    [Documentation]    asserts if an automationpractice account has been created
    Element Should Be Visible    ${WISHLIST}
