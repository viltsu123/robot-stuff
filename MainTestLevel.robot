*** Settings ***
Library      SeleniumLibrary

*** Keywords ***
Play A Video
    ${webelement}=      Get WebElement      xpath=//*[@id='search-input']
    Wait Until Element Is Visible       ${webelement}
    Click Element   ${webelement}
    Press Keys      ${webelement}    die+SPACE+antwoord
    Click Element   xpath=//button[@id='search-icon-legacy']
    Sleep   3
    Click Element       xpath=//a[@id='video-title']

*** Test Cases ***
Log Hello
    Log     Hello World!

Open Browser And Go Home
    Open Browser    browser=Chrome
    Go To       https://www.youtube.com
    Sleep   3
    ${webelement}=      Get WebElement      xpath=//button//span
    Log     ${webelement}
    Click Element       ${webelement}
    Play A Video