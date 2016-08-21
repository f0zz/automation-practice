*** Settings ***
Library         Selenium2Library
Resource        keywords/mg_keywords.robot


*** Test Cases ***
Log In And Close
    Log In To Tab Tree
    Close All Browsers

Create Valid New User
    Open Chrome To Tab Tree
    Create New User         eff    password    eff@example.com
    Page Should Contain     Your Trees
    Close All Browsers