*** Settings ***
Library     RequestsLibrary

*** Test Cases ***
Hello World
    Create Session    greeting      http://localhost:8000
    ${resp}=    Get Request    greeting    /api/v1/product
    Request Should Be Successful    ${resp}
    ${message}=   Convert To String    ${resp.content}
    Should Contain    ${message}    products
