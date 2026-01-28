*** Settings ***
Library    RequestsLibrary
Library    Collections
Library    OperatingSystem
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


And consultar saldo da conta
    [Arguments]    ${account_id}

    ${endpoint}=    Set Variable    /api/v1/accounts/${account_id}/balance

    Log To Console    \n=== REQUEST ===
    Log To Console    METHOD: GET
    Log To Console    ENDPOINT: ${endpoint}

    ${RESPONSE}=    GET On Session
    ...    api
    ...    ${endpoint}

    Set Suite Variable    ${RESPONSE}

    Log To Console    \n=== RESPONSE ===
    Log To Console    STATUS CODE: ${RESPONSE.status_code}
    Log To Console    BODY:
    Log To Console    ${RESPONSE.text}


Then validar status code 200
    Should Be Equal As Numbers    ${RESPONSE.status_code}    200


And validar schema do saldo
    ${json}=    Evaluate    $RESPONSE.json()

    Dictionary Should Contain Key    ${json}    balance
    Dictionary Should Contain Key    ${json}    blocked_balance
    Dictionary Should Contain Key    ${json}    scheduled_balance

    Should Be True    isinstance(${json['balance']}, int)
    Should Be True    isinstance(${json['blocked_balance']}, int)
    Should Be True    isinstance(${json['scheduled_balance']}, int)

    ${keys}=    Get Dictionary Keys    ${json}
    Length Should Be    ${keys}    3
