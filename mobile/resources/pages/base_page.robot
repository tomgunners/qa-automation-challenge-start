*** Settings ***
Library    AppiumLibrary

*** Keywords ***
Wait And Click
    [Arguments]    ${locator}
    Wait Until Element Is Visible    ${locator}    20s
    Click Element    ${locator}
    
Swipe Down Until Visible
    [Arguments]    ${locator}    ${max_attempts}=5    ${swipe_wait}=1s

    FOR    ${index}    IN RANGE    ${max_attempts}
        ${element_visible}=    Run Keyword And Return Status
        ...    Element Should Be Visible    ${locator}

        Run Keyword If    ${element_visible}    Exit For Loop

        Swipe    500    1500    500    500    1000
        Sleep    ${swipe_wait}
    END

