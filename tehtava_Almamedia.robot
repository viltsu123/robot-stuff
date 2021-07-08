***Settings***
Library     SeleniumLibrary
Library     DebugLibrary
Test Teardown       Close Browser

***Test Cases***
Go And Do The Thing
    Open Browser    https://www.almamedia.fi    Chrome
    Wait Until Element Is Visible      xpath=//h2[contains(text(), 'Käytämme evästeitä')] 
    ${webelement}=      Get WebElement      xpath=//*[@id="almacmp-modalConfirmBtn"]
    Log     ${webelement}
    Click Element       ${webelement}
    Click Element   xpath=//*[@id="navigation"]/div/div[1]/nav/div/div[2]/ul/li[3]/a
    Sleep   1
    Click Element   xpath=//*[@id="navigation"]/div/div[1]/nav/div/div[2]/ul/li[3]/ul/li[1]/a
    Sleep   1
    Click Element   xpath=//*[@id="business-area-results"]/div[8]/a/div/img
    Sleep   2
    Switch Window      NEW
    Sleep   5
    Click Element   xpath=//*[@id="alma-data-policy-banner__accept-all"]
    Input Text      //*[@id="recipe-search-free-text"]      makaronilaatikko
    Click Element       xpath=//*[@id="recipe-search-free-text-submit"]
    Sleep   3
    Click Element   xpath=//*[@id="content"]/div[3]/div/div[1]/div[3]/div[1]/div[2]/form/fieldset/label[6]/input
    Sleep   2
    Click Element   xpath=//*[@id="content"]/div[3]/div/div[1]/div[3]/div[1]/div[3]/form/fieldset/label[4]/input
    Sleep   3
    Click Element   xpath=//*[@id="recipe-search-results"]/li[1]/a[2]
    Sleep   3
    Scroll Element Into View    xpath=//*[@id="content"]/div[3]/div/div[2]/div[1]/div/a[@class='btn']
    Click Element   xpath=//*[@id="content"]/div[3]/div/div[2]/div[1]/div/a[@class='btn']
    Sleep   3
    Click Element   xpath=//*[@id="shoppinglist-handle"]/button/i
    Sleep   5
    ${elements}     Get WebElements     xpath://li[@class='ingredient']
    FOR     ${element}     IN      @{elements}
        ${text}     Get Text    ${element}
        Log To Console     ${text}
    END





