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

And validar estrutura do extrato
    ${body}=    Evaluate    $RESPONSE.json()

    Dictionary Should Contain Key    ${body}    cursor
    Dictionary Should Contain Key    ${body}    data

    ${items}=    Get From Dictionary    ${body}    data
    ${total}=    Get Length    ${items}

    Run Keyword If    ${total} > 0
    ...    Validar item do extrato    ${items}[0]

Validar item do extrato
    [Arguments]    ${item}
    Dictionary Should Contain Key    ${item}    account_id
    Dictionary Should Contain Key    ${item}    amount
    Dictionary Should Contain Key    ${item}    balance_after
    Dictionary Should Contain Key    ${item}    balance_before
    Dictionary Should Contain Key    ${item}    created_at
    Dictionary Should Contain Key    ${item}    id
    Dictionary Should Contain Key    ${item}    operation
    Dictionary Should Contain Key    ${item}    status
    Dictionary Should Contain Key    ${item}    type
