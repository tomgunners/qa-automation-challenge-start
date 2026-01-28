*** Settings ***
Library    RequestsLibrary
Resource   ../config/env.resource

*** Variables ***
${TOKEN_ENDPOINT}   /auth/realms/stone_account/protocol/openid-connect/token
${CLIENT_ID}        admin-cli
${USERNAME}         desafioqastone@gmail.com
${PASSWORD}         desafioqa
${GRANT_TYPE}       password

*** Keywords ***
Gerar Token de Acesso
    [Documentation]    Gera o access_token da API Stone
    Create Session
    ...    auth
    ...    ${AUTH_BASE_URL}
    ...    headers={"Content-Type":"application/x-www-form-urlencoded"}

    ${data}=    Create Dictionary
    ...    client_id=${CLIENT_ID}
    ...    username=${USERNAME}
    ...    password=${PASSWORD}
    ...    grant_type=${GRANT_TYPE}

    ${response}=    POST On Session
    ...    auth
    ...    ${TOKEN_ENDPOINT}
    ...    data=${data}

    Should Be Equal As Numbers    ${response.status_code}    200

    ${token}=    Set Variable    ${response.json()['access_token']}
    [Return]    ${token}   # Retorna o token
