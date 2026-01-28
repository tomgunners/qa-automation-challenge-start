*** Settings ***
Library    RequestsLibrary
Library    Collections
Resource   ../step_definitions/internal_transfer_steps.robot

*** Variables ***
@{ACCOUNT_IDS}
...    bccd3bf7-3369-4622-b769-71f93d66da87

*** Test Cases ***
Realizar dry run de transferência interna
    [Documentation]    Teste de Dry Run de Transferência Interna
    FOR    ${account_id}    IN    @{ACCOUNT_IDS}
        Given que o token da API foi gerado
        When criar sessão autenticada com token
        And realizar dry run de transferencia interna para conta    ${account_id}
        Then validar status code 201
    END
