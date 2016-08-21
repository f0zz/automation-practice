*** Keywords ***
Log In To Tab Tree
    Open Chrome To Tab Tree
    Input Text                          xpath=//input[@id="session_email"]       ender@example.com
    Input Text                          xpath=//input[@id="session_password"]    password
    Click Element                       xpath=//input[@name="commit"]

Create New User
    [Arguments]     ${username}     ${password}     ${email}
    Open Chrome To Tab Tree
    Click Element                       xpath=//a[@href="/sign_up"]
    Wait Until Page Contains Element    xpath=//input[@id="user_name"]
    Input Text                          xpath=//input[@id="user_name"]           ${username}
    Input Text                          xpath=//input[@id="user_email"]          ${email}
    Input Text                          xpath=//input[@id="user_password"]       ${password}
    Click Element                       xpath=//input[@name="commit"]


Open Chrome To Tab Tree
    Open Browser                        https://tab-it.herokuapp.com             browser=gc
    Wait Until Page Contains Element    xpath=//input[@id="session_email"]