*** Settings ***
Library    RequestsLibrary
Library    Collections
Resource   ../libs/auth/auth.resource
Resource   ../resources/base_api.resource
Resource   ../libs/utils/faker_utils.robot

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

And realizar dry run de transferencia interna para conta
    [Arguments]    ${account_id}

    ${payload}=    Gerar Payload Transferencia Interna    ${account_id}

    Log To Console    \n=== PAYLOAD ===
    Log To Console    ${payload}

    ${RESPONSE}=    POST On Session
    ...    api
    ...    /api/v1/dry_run/internal_transfers
    ...    json=${payload}

    Set Suite Variable    ${RESPONSE}

    Log To Console    \n=== RESPONSE ===
    Log To Console    STATUS CODE: ${RESPONSE.status_code}
    Log To Console    BODY:
    Log To Console    ${RESPONSE.text}

Then validar status code 201
    Should Be Equal As Numbers    ${RESPONSE.status_code}    201