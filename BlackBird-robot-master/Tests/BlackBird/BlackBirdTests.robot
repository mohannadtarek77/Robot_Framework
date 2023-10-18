*** Settings ***
Library    Browser

Resource    ../../Utilities/BrowserFactory.robot
Resource    ../../Object Models/Pages/BlackBird/BlackBirdPage.robot
Resource    ../../Utilities/JsonTestDataReader.robot

Suite Setup    Setup
Suite Teardown    Close Browser

*** Variables ***

*** Test Cases ***
Search for the name of the CTO in Blackbird's Website
    Search for Blackbird    ${testData["searchQuery"]["blackbird"]}
    Validate Search Result for BlackBird    ${testData["index"]}    ${testData["Expected"]["blackbirdLink"]}
    Click on Blackbird website
    Validate CTO Name     ${testData["index"]}    ${testData["Expected"]["CTOName"]}

*** Keywords ***
Setup
    Load Test Data JSON File    BlackBird.json
    Initialize New Browser
    Navigate To Google Home Page

