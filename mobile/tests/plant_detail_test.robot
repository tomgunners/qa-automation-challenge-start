*** Settings ***
Resource    ../resources/setup/appium_setup.robot
Resource    ../resources/pages/home_page.robot
Resource    ../resources/pages/plant_list_page.robot
Resource    ../resources/pages/plant_detail_page.robot

Suite Setup     Start Application Session
Suite Teardown  Stop Application Session

*** Test Cases ***
CT005 - Validar Tela Detalhe da Planta
    Open Add Plant Screen
    Validate Plant List Screen
    Select First Plant From List
    Validate Plant Detail Screen
    Validate Plant Name Is Displayed
    Validate Plant Description Is Displayed
    Validate Plant Image Is Displayed

CT006 - Voltar da Tela de Detalhe da Planta
    Tap Back Button From Plant Detail
    Validate Plant List Screen
