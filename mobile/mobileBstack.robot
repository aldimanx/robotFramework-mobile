*** Settings ***
Library    AppiumLibrary
Resource    ${CURDIR}/../variablesBstack.robot
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
    
login with incorrect account
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
       Open Application    ${REMOTE_URL}    app=bs://18970685fc75d08a226a8c694ccfddd08cf753c6   name=single_test    build=RobotFramework    
       ...    platformName=Android    os_version=12.0    deviceName=Samsung Galaxy S21