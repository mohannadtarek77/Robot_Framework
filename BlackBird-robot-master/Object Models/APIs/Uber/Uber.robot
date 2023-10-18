
*** Settings ***
Library    RequestsLibrary
Library    JSONLibrary


*** Variables ***
${products_api}   https://api.uber.com/v1.2/products
${latitude}           37.40218823018612
${longitude}          -121.9329707487431
${start_latitude}      37.7752315
${start_longitude}     -122.418075
${end_latitude}         37.7752415
${end_longitude}        -122.518075
${estimates_api}    https://api.uber.com/v1.2/estimates/price


*** Keywords ***
List the available products for a location
    ${queryParams}=    Create Dictionary    latitude=${latitude}    longitude=${longitude} 
    ${response}=    GET    ${products_api}     params=${queryParams}
    ${list_of_products}=    Get Value From Json    ${response.json()}    $.products
    [Return]    ${list_of_products}
    

Get price estimate for two locations
    ${queryParams}=    Create Dictionary    start_latitude=${start_latitude}    start_longitude=${start_longitude}      end_latitude=${end_latitude}    end_longitude=${end_longitude} 
    ${response}=     GET     ${estimates_api}     params=${queryParams}
    ${price_estimate}=    Get Value From Json    ${response.json()}    $.prices[0].estimate
    [Return]    ${price_estimate}
    

Validate That Response Body Contains Products List   
    [Arguments]     ${unExpectedZeroResult} 
    ${actual_products} =    List the available products for a location
    ${lengthOfProductsSize}=   Get Length   ${actual_products}
    Should Not Be Equal   ${lengthOfProductsSize}     ${unExpectedZeroResult}  

Validate That Response Body Contains the Price Estimate
    [Arguments]   ${expectedResult}
    ${price_estimate} =    Get price estimate for two locations
    Should Be Equal    ${price_estimate}    ${expectedResult}
