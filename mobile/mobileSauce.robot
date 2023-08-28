*** Settings ***
Library    AppiumLibrary
Resource    ${CURDIR}/../variables.robot
Test Timeout    2 minutes
*** Variables ***
${password}    secret_sauce

*** Test Cases ***
user login with correct account
    Open Test Application
        Sleep    5s

    Wait Until Element Is Visible    xpath=//android.widget.EditText[@content-desc="test-Username"]
    Input Text    xpath=//android.widget.EditText[@content-desc="test-Username"]    standard_user
    Input Text    xpath=//android.widget.EditText[@content-desc="test-Password"]    ${password}
    Click Element    xpath=//android.view.ViewGroup[@content-desc="test-LOGIN"]
    Wait Until Element Is Visible    xpath=//android.widget.TextView[@text="PRODUCTS"]

    Click Element    xpath=//android.view.ViewGroup[@content-desc="test-Menu"]/android.view.ViewGroup/android.widget.ImageView
        Wait Until Element Is Visible    xpath=//android.view.ViewGroup[@content-desc="test-LOGOUT"]/android.widget.TextView
    Click Element    xpath=//android.view.ViewGroup[@content-desc="test-LOGOUT"]/android.widget.TextView
        Wait Until Element Is Visible    xpath=//android.view.ViewGroup[@content-desc="test-LOGIN"]

    Element Should Be Visible    xpath=//android.view.ViewGroup[@content-desc="test-LOGIN"]

    [Teardown]    Close Application

user login with incorrect account
    Open Test Application
            Sleep    5s

    Wait Until Element Is Visible    xpath=//android.widget.EditText[@content-desc="test-Username"]
    Input Text    xpath=//android.widget.EditText[@content-desc="test-Username"]    randomacc
    Input Text    xpath=//android.widget.EditText[@content-desc="test-Password"]    ${password}
    Click Element    xpath=//android.view.ViewGroup[@content-desc="test-LOGIN"]
        Wait Until Element Is Visible    xpath=//android.view.ViewGroup[@content-desc="test-Error message"]/android.widget.TextView

    Element Should Be Visible    xpath=//android.view.ViewGroup[@content-desc="test-Error message"]/android.widget.TextView
    
    [Teardown]    Close Application



*** Keywords ***
Open Test Application
      Open Application    http://127.0.0.1:4723    automationName=${ANDROID_AUTOMATION_NAME}
      ...    platformName=${ANDROID_PLATFORM_NAME}    platformVersion=${ANDROID_PLATFORM_VERSION}
      ...    app=${ANDROID_APP}    appPackage=com.swaglabsmobileapp    appActivity=com.swaglabsmobileapp.MainActivity
      