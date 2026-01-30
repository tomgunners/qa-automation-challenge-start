*** Settings ***
Library    RequestsLibrary
Library    Collections
Library    BuiltIn

Resource   ../libs/auth/auth.resource
Resource   ../resources/base_api.resource

*** Keywords ***
Given que o token da API foi gerado
    ${TOKEN}=    Gerar Token de Acesso
    Set Suite Variable    ${TOKEN}
    Log To Console    \n=== TOKEN GERADO ===
    Log To Console    ${TOKEN}

When criar sessão autenticada com token
    Criar Sessao Autenticada    ${TOKEN}
    Log To Console    \n=== SESSÃO CRIADA ===
    Log To Console    Base URL: ${API_BASE_URL}

And consultar extrato da conta
    [Arguments]    ${account_id}

    ${ENDPOINT}=    Set Variable    /api/v1/accounts/${account_id}/statement

    Log To Console    \n=== REQUEST ===
    Log To Console    METHOD: GET
    Log To Console    ENDPOINT: ${ENDPOINT}

    ${RESPONSE}=    GET On Session
    ...    api
    ...    ${ENDPOINT}

    Set Suite Variable    ${RESPONSE}

    Log To Console    \n=== RESPONSE ===
    Log To Console    STATUS CODE: ${RESPONSE.status_code}
    Log To Console    BODY:
    Log To Console    ${RESPONSE.text}

Then validar status code 200
    Should Be Equal As Numbers    ${RESPONSE.status_code}    200
