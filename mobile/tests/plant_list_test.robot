*** Settings ***
Resource    ../resources/setup/appium_setup.robot
Resource    ../resources/pages/home_page.robot
Resource    ../resources/pages/plant_list_page.robot

Suite Setup     Start Application Session
Suite Teardown  Stop Application Session

*** Test Cases ***
CT003 - Validar Tela Lista de Plantas
    Open Add Plant Screen
    Validate Plant List Screen
    Validate Plant List Is Displayed

CT004 - Selecionar Primeira Planta da Lista
    Select First Plant From List
