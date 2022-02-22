*** Settings ***
Documentation    Generic functions to help with the automation.
Library           SeleniumLibrary
Library           FakerLibrary
Library           Collections
Variables          ../config.py

*** Keywords ***
Click In
    [Arguments]    ${locator}    ${timeout}=5s
    [Documentation]    Wraps the repetitive action of waiting and then clicking
    Wait Until Element Is Visible    ${locator}    ${timeout}
    Click Element    ${locator}

Input
    [Arguments]    ${locator}    ${text}    ${timeout}=5s    ${passwd}=False
    [Documentation]    Wraps the repetitive action of waiting and then filling a field
    Wait Until Element Is Visible    ${locator}    ${timeout}
    IF    not ${passwd}
        Input Text    ${locator}    ${text}
    ELSE
        Input Password    ${locator}    ${text}
    END

Go To Login Page
    [Documentation]    Access the login page by clicking
    ...    in the login button at the home page,
    ...    generates a random email address, fill
    ...    the email field and send the form.
    Go To    http://automationpractice.com/index.php
    Element Should Be Visible    ${LOGINPAGE_BTN}
    Click In    ${LOGINPAGE_BTN}
    Wait Until Element Is Visible    ${CREATE_ACC.email_field}

Go To Registration Page
    ${email}    Ascii Safe Email
    Input    ${CREATE_ACC.email_field}    ${email}
    Click In    ${CREATE_ACC.submit_btn}
    Wait Until Element Is Visible    ${PERSONAL_INFO.firstname}

Input Birthdate
    [Documentation]    Input the birthdate
    Select From List By Value    ${PERSONAL_INFO.day}    3
    Select From List By Value    ${PERSONAL_INFO.month}    5
    Select From List By Value    ${PERSONAL_INFO.year}    1980

Generate Data
    [Documentation]    Generate a random data
    &{fake_data}    Create Dictionary
    ${fake_data.firstname}    First Name
    ${fake_data.lastname}    Last Name
    ${fake_data.email}    Ascii Safe Email
    ${fake_data.passwd}    Password
    ${fake_data.company}    Company
    ${fake_data.address1}    Street Address
    ${fake_data.city}    City
    ${fake_data.state}    State
    ${fake_data.postcode}    Postcode
    Set To Dictionary    ${fake_data}    alias=Alias
    [Return]    ${fake_data}

Setup
    [Documentation]    Setup the test
    ${FAKE_DATA}    Generate Data
    Set Suite Variable    ${FAKE_DATA}
    Create Chrome WebDriver

Create Chrome WebDriver
    [Documentation]    Create a web driver
    ${options}    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver
    Call Method    ${options}    add_argument    incognito
    Call Method    ${options}    add_argument    start-maximized
    Log    ${ROOT}/drivers/chromedriver  console=True
    Create WebDriver    Chrome    chrome_options=${options}    executable_path=${ROOT}/ui/drivers/chromedriver