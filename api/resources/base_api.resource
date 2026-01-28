*** Settings ***
Library    RequestsLibrary
Resource   ../libs/config/env.resource

*** Keywords ***
Criar Sessao Autenticada
    [Arguments]    ${token}
    [Documentation]    Cria sessão API usando token passado como argumento
    ${HEADERS}=    Create Dictionary
    ...    Authorization=Bearer ${token}
    ...    Content-Type=application/json
    Create Session
    ...    api
    ...    ${API_BASE_URL}
    ...    headers=${HEADERS}
