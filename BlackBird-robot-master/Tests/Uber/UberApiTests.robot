*** Settings ***
Resource    ../../Utilities/Helper.robot
Resource    ../../Utilities/JsonTestDataReader.robot
Resource    ../../Object Models/APIs/Uber/Uber.robot


Suite Setup    Setup

*** Test Cases ***
List the available products for a given location
    List the available products for a location
    Validate That Response Body Contains Products List       ${testData["UnExpected"]["zeroValue"]}

Get price estimate for a ride between two locations
    Get price estimate for two locations
    Validate That Response Body Contains the Price Estimate    ${testData["Expected"]["estimate"]}


*** Keywords ***
Setup
    Load Test Data JSON File    Uber.json

