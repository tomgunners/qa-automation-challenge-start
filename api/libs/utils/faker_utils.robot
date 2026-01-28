*** Settings ***
Library    Collections
Library    DateTime
Library    BuiltIn

*** Variables ***
${DEFAULT_ACCOUNT_CODE}    475384

*** Keywords ***
Gerar Payload Transferencia Interna
    [Arguments]    ${account_id}

    ${amount}=    Evaluate    random.randint(100, 5000)    modules=random
    ${fee}=       Evaluate    random.randint(0, 300)       modules=random

    ${uuid}=      Evaluate    str(__import__('uuid').uuid4())
    ${today}=     Get Current Date    result_format=%Y-%m-%d
    ${now}=       Get Current Date    result_format=%Y-%m-%dT%H:%M:%SZ

    ${account_code}=    Set Variable    ${DEFAULT_ACCOUNT_CODE}

    ${payload}=    Create Dictionary
    ...    amount=${amount}
    ...    approval_expired_at=${None}
    ...    approved_at=${now}
    ...    approved_by=user:${uuid}
    ...    cancelled_at=${None}
    ...    created_at=${now}
    ...    created_by=user:${uuid}
    ...    description=Dry run - simulação transferência interna Stone
    ...    failed_at=${None}
    ...    fee=${fee}
    ...    finished_at=${None}
    ...    id=${uuid}
    ...    rejected_at=${None}
    ...    rejected_by=${None}
    ...    scheduled_to=${today}
    ...    status=APPROVED
    ...    account_id=${account_id}

    ${target_account}=    Create Dictionary    account_code=${account_code}
    ${target_entity}=     Create Dictionary    name=Cliente Teste
    ${target}=            Create Dictionary
    ...    account=${target_account}
    ...    entity=${target_entity}

    Set To Dictionary    ${payload}    target    ${target}

    [Return]    ${payload}
