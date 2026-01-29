*** Settings ***
Resource    locators/plant_detail_locators.robot
Resource    base_page.robot

*** Keywords ***
Validate Plant Detail Screen
    Wait Until Element Is Visible    ${LBL_PLANT_DETAIL_TITLE}    20s

Validate Plant Name Is Displayed
    Wait Until Element Is Visible    ${LBL_PLANT_NAME}    20s

Validate Plant Description Is Displayed
    Wait Until Element Is Visible    ${LBL_PLANT_DESCRIPTION}    20s

Validate Plant Image Is Displayed
    Wait Until Element Is Visible    ${IMG_PLANT}    20s

Tap Back Button From Plant Detail
    Wait And Click    ${BTN_BACK}
