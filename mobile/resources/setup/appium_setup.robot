*** Settings ***
Library    AppiumLibrary

*** Variables ***
${APPIUM_URL}        http://127.0.0.1:4723
${PLATFORM_NAME}    Android
${DEVICE_NAME}      emulator-5554
${AUTOMATION_NAME}  UiAutomator2
${UDID}             emulator-5554
${APP}                mobile/drivers/Sunflower.apk
${APP_PACKAGE}        com.google.samples.apps.sunflower
${APP_ACTIVITY}       com.google.samples.apps.sunflower.GardenActivity


*** Keywords ***
Start Application Session
    Open Application    ${APPIUM_URL}
    ...    newCommandTimeout=300
    ...    implicit_wait=25
    ...    platformName=${PLATFORM_NAME}
    ...    deviceName=${DEVICE_NAME}
    ...    app=${APP}
    ...    udid=${UDID}
    ...    appPackage=${APP_PACKAGE}
    ...    appActivity=${APP_ACTIVITY}
    ...    automationName=${AUTOMATION_NAME}
    ...    autoGrantPermissions=true

Stop Application Session
    Close Application