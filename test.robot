*** Settings ***
Test Setup          Open Chrome To Tab Tree
Test Teardown       Close All Browsers
Suite Teardown      Close All Browsers
Library             Selenium2Library
Resource            keywords/mg_keywords.robot


*** Test Cases ***
Log In And Close
    Log In To Tab Tree
    Sign Out Of Tab Tree

Create Valid New User Should Succeed
    Create New User                 eff    password    eff@example.com
    Page Should Contain             Your Trees

Create Existing User Should Fail
    Create New User                 ender    password    ender@example.com
    Page Should Contain             Errors: Unable to create Account

Searching Without Logging In Should Fail
    Enter Text Into Search Bar      this should not work
    Click Search Button
    Page Should Contain             Sign In
    Page Should Not Contain         Search Results

Search While Logged In Should Succeed
    Log In To Tab Tree
    Enter Text Into Search Bar      main branch
    Click Search Button
    Page Should Contain             Search Results
    Page Should Contain Element     xpath=//h3[@class="btn-leaf"]

