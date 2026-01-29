*** Settings ***
Resource    ../resources/setup/appium_setup.robot
Resource    ../resources/pages/home_page.robot

Suite Setup     Start Application Session
Suite Teardown  Stop Application Session

*** Test Cases ***
CT001 - Validar Tela My Garden
    Validate My Garden Screen

CT002 - Abrir Tela de Adicionar Planta
    Open Add Plant Screen