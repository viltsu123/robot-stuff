*** Settings ***
Library             SeleniumLibrary
Library             RPA.Tables
Library             RPA.Excel.Files
Library             Collections

*** Variables ***
${SEARCH_FILE}      workbook.xlsx
${row_count}        2
${firstVisitYoutube}    on eka

*** Keywords ***
Play A Video
    [Arguments]     ${hakusana}     ${osoite}
    Go To   ${osoite}
    Log     ${firstVisitYoutube}
    IF      '${firstVisitYoutube}' == 'on eka'
        ${webelement}=      Get WebElement      xpath=//button//span[contains(text(), 'I agree')]
        Log     ${webelement}
        Click Element       ${webelement}
        Set Suite Variable      ${firstVisitYoutube}    on toka
    END
    ${webelement}=      Get WebElement      xpath=//*[@id='search-input']
    Wait Until Element Is Visible       ${webelement}
    Click Element   ${webelement}
    Press Keys      ${webelement}    ${hakusana}
    Click Element   xpath=//button[@id='search-icon-legacy']
    Sleep   3
    Click Element       xpath=//a[@id='video-title']

Read Data From Excel
    Open workbook    ${SEARCH_FILE}
    ${worksheet}=    Read worksheet   header=${TRUE}
    ${orders}=       Create table     ${worksheet}
    Log     ${orders}
    Close Workbook
    [Return]         ${orders}

Write To Excel Handled
    [Arguments]     ${row_number}
    Open workbook   ${SEARCH_FILE}
    Set Active Worksheet    Sheet1
    Set Worksheet Value     row=${row_number}
    ...                     column=3
    ...                     value=done
    Save Workbook
    Close Workbook

Open Browser And Go To Page
    Open Browser    https://www.google.com      Chrome

    ${webelement}=      Get WebElement      xpath=//button//div[contains(text(), 'I agree')]
    Log     ${webelement}
    Click Element       ${webelement}

Get row count in the sheet
    [Arguments]      ${SHEET_NAME}
    Open workbook   ${SEARCH_FILE}
    ${sheet}=        Read Worksheet   ${SHEET_NAME}
    ${rows}=         Get Length  ${sheet}
    [Return]         ${rows}
    Close Workbook

Execute Search Process
    Log     Opening Browser
    Open Browser And Go To Page
    Log     Luetaan data rivit
    ${table}       Read Data From Excel
    ${row_count}        Convert To Integer      ${row_count}
    FOR  ${row}  IN   @{table}
        Log   ${row}
        ${done_field}=      Get From Dictionary     ${row}      hoideltu
        ${address}=     Get From Dictionary     ${row}      osoite
        IF      '${done_field}' != 'done'
            IF      '${address}' == 'https://www.google.com'
                Go To   ${address}
                ${address}=     Get From Dictionary     ${row}      osoite
                Log     ${address}
                ${searchword}=       Get From Dictionary     ${row}      hakusana
                Log     ${searchword}
                Sleep       1
                Input Text      xpath://input[@aria-label='Search']    ${searchword}
                Sleep       1
                Press Keys       xpath://input[@aria-label='Search']     RETURN
                Sleep       1
            ELSE
                Log     Youtube sivu, soitetaan video
                ${hakusana}=    Get From Dictionary     ${row}      hakusana
                Play A Video    ${hakusana}     ${address}
            END
            Write To Excel Handled      ${row_count}
        ELSE
            Log     row number ${row_count} has been handled, moving to next row.
        END
        ${row_count}    Evaluate    ${row_count}+1
    END
    Sleep   2
    ${row_count}    Evaluate    ${row_count}-1
    Close Browser

*** Tasks ***
Execute Searches On Different Web Pages
    Execute Search Process
