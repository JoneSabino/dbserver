*** Settings ***
Documentation     File with the mapped locators used in the automation.

*** Variables ***
${LOGINPAGE_BTN}    class:login

&{CREATE_ACC}     email_field=css:input#email_create
...               submit_btn=css:button#SubmitCreate > span

&{PERSONAL_INFO}    title=id:id_gender1
...               firstname=id:customer_firstname
...               lastname=id:customer_lastname
...               email=id:email
...               passwd=id:passwd
...               day=id:days
...               month=id:months
...               year=id:years
...               company=id:company
...               address1=id:address1
...               address2=id:address2
...               city=id:city
...               state=id:id_state
...               postcode=id:postcode
...               other=id:other
...               phone=id:phone
...               phone_mobile=id:phone_mobile
...               addr_alias=id:alias
...               addr_firstname=id:firstname
...               addr_lastname=id:lastname
...               country=id:id_country

${REGISTER_BTN}    id:submitAccount
${WISHLIST}       css:a[title="My wishlists"]
${LOGIN_EMAIL}    css:input[name='email']
${LOGIN_PASSWORD}    css:input[name='passwd']
${LOGINSUBMIT_BTN}    id:SubmitLogin
${RED_FLAG}       css:#center_column > .alert-danger
