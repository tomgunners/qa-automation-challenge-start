*** Settings ***
Resource    locators/plant_list_locators.robot
Resource    base_page.robot

*** Keywords ***
Validate Plant List Screen
    Wait Until Element Is Visible    ${LBL_PLANT_LIST_TITLE}    20s

Validate Plant List Is Displayed
    Wait Until Element Is Visible    ${LIST_PLANTS}    20s

Select First Plant From List
    Wait Until Element Is Visible    ${FIRST_PLANT_ITEM}    20s
    Wait And Click                  ${FIRST_PLANT_NAME}

Scroll Plant List Down
    Swipe Down Until Visible    ${FIRST_PLANT_NAME}


Validate Plant Name Is Displayed In List
    Wait Until Element Is Visible    ${FIRST_PLANT_NAME}    20s

