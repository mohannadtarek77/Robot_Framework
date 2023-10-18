*** Settings ***
Library    Browser

Resource    ../../../Resources/Configurations/Environments.resource

*** Variables ***
${url}    ${googleBaseUrl}
${searchBat_textField}    xpath=//*[@name='q']
${blackbird_locator}      //a[@href='https://www.blackbird.ai/team']

*** Keywords ***
## Locators getters
Get Blackbird Locator
    [Arguments]    ${index}
    ${locator}  Set Variable    //a[@href='https://www.blackbird.ai/team']
    [return]    ${locator} 

Get CTO Locator
    [Arguments]    ${index}
    ${locator}  Set Variable    //h1[normalize-space()='Dr. Naushad UzZaman']
    [return]    ${locator} 
    
*** Keywords ***
## Actions
Navigate To Google Home Page
    New Page       ${url}

Search for Blackbird
    [Arguments]    ${query}
    Type Text    ${searchBat_textField}    ${query}
    Keyboard Key    press    Enter 

Click on Blackbird website
    Click    ${blackbird_locator}     

*** Keywords ***
## Validations
Validate Search Result for BlackBird
    [Arguments]   ${index}    ${ExpectedText}
    ${searchResultLocator}=    Get Blackbird Locator    1
    Get Text    ${searchResultLocator}    ==    ${ExpectedText}

Validate CTO Name
    [Arguments]   ${index}    ${ExpectedText}
    ${searchResultLocator}=    Get CTO Locator    1
    Get Text    ${searchResultLocator}    ==    ${ExpectedText}