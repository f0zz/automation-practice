*** Settings ***
Library         Selenium2Library
Resource        keywords/mg_keywords.robot


*** Test Cases ***
Start It Up
    Log In To Tab It
    Close All Browsers


*** Keywords ***
Log In To Tab It
    Open To Tab Tree Using Chrome