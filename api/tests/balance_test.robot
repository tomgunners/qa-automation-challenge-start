*** Settings ***
Library    RequestsLibrary
Library    Collections
Resource   ../step_definitions/balance_steps.robot

*** Variables ***
@{ACCOUNT_IDS}    
...    bccd3bf7-3369-4622-b769-71f93d66da87

*** Test Cases ***
Consultar saldo das conta
    [Documentation]    Teste de Consultar Saldo da Conta
    FOR    ${account_id}    IN    @{ACCOUNT_IDS}
        Given que o token da API foi gerado
        When criar sessão autenticada com token
        And consultar saldo da conta    ${account_id}
        Then validar status code 200
        And validar schema do saldo
    END
