*** Settings ***

Library         AppiumLibrary
Resource    ./settings/config_variables.robot
Resource    ./settings/test_variables.robot

*** Variables ***

${position}    Create List    120    733

*** Test Cases ***

Open Application
    [Documentation]    Install app on pcloudy test device based on configuration input
	Open Application    ${pcloudy_link}   pCloudy_Username=${pcloudy_username} 	pCloudy_ApiKey=${pcloudy_apiKey}   platformName=${pcloudy_platformName}	pCloudy_ApplicationName=${pcloudy_appName}   pCloudy_DeviceManafacturer=${pcloudy_deviceManufacturer}    pCloudy_DeviceFullName=${pcloudy_deviceFulleName}   appPackage=${pcloudy_appPackage} 	appActivity=${pcloudy_appActivity}    automationName=${pcloudy_automationName} 

Click On Continue 
    [Documentation]    Click on Continue button after splash screen to go to login screen
    Wait Until Element Is Visible    //android.view.ViewGroup[@content-desc='button Continue']
    Click Element	//android.view.ViewGroup[@content-desc='button Continue']
    Log To Console	Continue Button is clicked

Login Screen
    [Documentation]    Continue with mobile number
    Wait Until Element Is Visible     //android.widget.TextView[@text='Empower yourself with life-saving skills']
    Element Should Be Visible    //android.view.ViewGroup[@content-desc='button Continue with']
    Element Should Be Visible    //android.view.ViewGroup[@content-desc='button Continue with mobile number']
    Click Element    //android.view.ViewGroup[@content-desc='button Continue with mobile number']
    Log To Console	Login Screen: Continue with mobile number Button is clicked

Terms & Condition Screen - Continue disabled
    [Documentation]    Continue button should be disabled if checkbox not ticked
    Page Should Contain Element    //android.view.ViewGroup[@content-desc='button Continue']
    Page Should Contain Element    //android.view.ViewGroup[@index='0']
    Element Should Be Disabled    //android.view.ViewGroup[@content-desc='button Continue']

Terms & Condition Screen - Continue enabled
    [Documentation]    Continue button should be enabled if checkbox is ticked
    Click Element    //android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup
    Element Should Be Enabled    //android.view.ViewGroup[@content-desc='button Continue']

Terms & Condition Screen - Continue
    [Documentation]    Click on Continue button
    Click Element     //android.view.ViewGroup[@content-desc='button Continue']
    Log To Console	T&C Screen: Continue Button is clicked

Continue with Mobile number screen - Invalid mobile number length & NRIC length
    [Documentation]    Given mobile number:${invalidPhone} and NRIC:${invalidIC}, next button should be disabled
    Input Text    //android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.widget.ScrollView/android.view.ViewGroup/android.view.ViewGroup[1]/android.view.ViewGroup/android.view.ViewGroup/android.widget.EditText    ${invalidPhone}
    Input Text    //android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.widget.ScrollView/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[1]/android.widget.EditText    ${invalidIC}
    Element Should Be Disabled    //android.view.ViewGroup[@content-desc='button Next']
    Clear Text    //android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.widget.ScrollView/android.view.ViewGroup/android.view.ViewGroup[1]/android.view.ViewGroup/android.view.ViewGroup/android.widget.EditText
    Clear Text    //android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.widget.ScrollView/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[1]/android.widget.EditText

Continue with Mobile number screen - Valid mobile number & invalid NRIC length
    [Documentation]    Given mobile number:${validPhone} and NRIC:${invalidIC}, next button should be disabled
	Input Text    //android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.widget.ScrollView/android.view.ViewGroup/android.view.ViewGroup[1]/android.view.ViewGroup/android.view.ViewGroup/android.widget.EditText    ${validPhone}
    Input Text    //android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.widget.ScrollView/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[1]/android.widget.EditText    ${invalidIC}
    Element Should Be Disabled    //android.view.ViewGroup[@content-desc='button Next']
    Clear Text    //android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.widget.ScrollView/android.view.ViewGroup/android.view.ViewGroup[1]/android.view.ViewGroup/android.view.ViewGroup/android.widget.EditText
    Clear Text    //android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.widget.ScrollView/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[1]/android.widget.EditText

Continue with Mobile number screen - Valid NRIC & invalid mobile number length
    [Documentation]    Given mobile number:${invalidPhone} and NRIC:${validIC}, next button should be disabled
	Input Text    //android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.widget.ScrollView/android.view.ViewGroup/android.view.ViewGroup[1]/android.view.ViewGroup/android.view.ViewGroup/android.widget.EditText    ${invalidPhone}
    Input Text    //android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.widget.ScrollView/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[1]/android.widget.EditText    ${validIC}
    Element Should Be Disabled    //android.view.ViewGroup[@content-desc='button Next']
    Clear Text    //android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.widget.ScrollView/android.view.ViewGroup/android.view.ViewGroup[1]/android.view.ViewGroup/android.view.ViewGroup/android.widget.EditText
    Clear Text    //android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.widget.ScrollView/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[1]/android.widget.EditText

Continue with Mobile number screen - Valid mobile number but invalid NRIC
    [Documentation]    Given mobile number:${validPhone} and NRIC:${invalidIC2}, next button should be enabled
    Input Text    //android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.widget.ScrollView/android.view.ViewGroup/android.view.ViewGroup[1]/android.view.ViewGroup/android.view.ViewGroup/android.widget.EditText    ${validPhone}
    Input Text    //android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.widget.ScrollView/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[1]/android.widget.EditText    ${invalidIC2}
    Element Should Be Enabled    //android.view.ViewGroup[@content-desc='button Next']

Continue with Mobile number screen - Click on Next button with valid mobile number but invalid NRIC
    [Documentation]    Given mobile number:${validPhone} and NRIC:${invalidIC2}, on clicking Next, warning modal should appear
    Click Element    //android.view.ViewGroup[@content-desc='button Next']
    Log To Console    Clicked on Next button
    Wait Until Element Is Visible    //android.widget.TextView[@text='Error']
    Log To Console    Invalid NRIC warning dialog appears
    Click Element    //android.view.ViewGroup[@content-desc='button Dismiss']
    Log To Console    Clicked on invalid NRIC warning dialog Dismiss button
    Page Should Not Contain Element    //android.widget.TextView[@text='Error']
    Log To Console    Invalid NRIC warning dialog should close

Continue with Mobile number screen - Click on Next button with valid mobile number and valid NRIC
    [Documentation]    Given mobile number:${validPhone} and NRIC:${validIC}, click on Next and proceed to next screen
    Clear Text    //android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.widget.ScrollView/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[1]/android.widget.EditText    
    Input Text    //android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.widget.ScrollView/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[1]/android.widget.EditText    ${validIC}
    Click Element    //android.view.ViewGroup[@content-desc='button Next']

Verify your mobile number screen - Verify with wrong OTP input
    [Documentation]    Given invalid OTP:222222, error should appear on submitting
    Wait Until Element Is Visible    //android.widget.TextView[@text='Verify your mobile number']
    Tap With Positions    ${position}
    Input Text    //android.view.ViewGroup[@index='3']    2
    Input Text    //android.view.ViewGroup[@index='4']    2
    Input Text    //android.view.ViewGroup[@index='5']    2
    Input Text    //android.view.ViewGroup[@index='6']    2
    Wait Until Element Is Visible    //android.widget.TextView[@text='Error']
    Log To Console    Invalid OTP input warning dialog appears
    Click Element    //android.view.ViewGroup[@content-desc='button Dismiss']
    Log To Console    Clicked on invalid OTP warning dialog's Dismiss button
    Page Should Not Contain Element    //android.widget.TextView[@text='Error']
    Log To Console    Invalid OTP warning dialog should close
    Clear Text    //android.view.ViewGroup[@index='1']    
    Clear Text    //android.view.ViewGroup[@index='2']    
    Clear Text    //android.view.ViewGroup[@index='3']    
    Clear Text    //android.view.ViewGroup[@index='4']    
    Clear Text    //android.view.ViewGroup[@index='5']    
    Clear Text    //android.view.ViewGroup[@index='6']    

# Close All Apps

# 	Close All Applications

*** Keywords ***
