*** Settings ***
Resource    locators/home_locators.robot
Resource    base_page.robot

*** Keywords ***
Validate My Garden Screen
    Wait Until Element Is Visible    ${TXT_MY_GARDEN}    20s

Open Add Plant Screen
    Wait And Click    ${BTN_ADD_PLANT}