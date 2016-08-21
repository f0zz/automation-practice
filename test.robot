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
    [Tags]    non-critical
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
    Wait Until Page Contains        Search Results
    Page Should Contain Element     xpath=//h3[@class="btn leaf"]

Create New Tree
    Log In To Tab Tree
    Click Element                           xpath=//a[@href="/trees/new"]
    Wait Until Page Contains Element        xpath=//form[@id="new_tree"]
    Input Text                              xpath=//input[@id="tree_name"]      sample tree
    Click Element                           xpath=//input[@name="commit" and @value="Create Tree"]
    Wait Until Page Contains                Your Trees
    Page Should Contain                     Tree Created.

Clicking Username Should Go To Profile Page
    Log In To Tab Tree
    Click Element           xpath=//a[@href="/users/1"]
    BuiltIn.Sleep           5s
    Page Should Contain     Ender's profile