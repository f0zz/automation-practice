*** Keywords ***
Open To Tab Tree Using Chrome
    Open Browser                        https://tab-it.herokuapp.com             browser=gc
    Wait Until Page Contains Element    xpath=//input[@id="session_email"]
    Input Text                          xpath=//input[@id="session_email"]       test@test.com
    Input Text                          xpath=//input[@id="session_password"]    password
    Click Element                       xpath=//input[@name="commit"]