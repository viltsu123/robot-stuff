***Settings***
Library     RPA.Tables
Library     SeleniumLibrary
Library     Collections
Library     RPA.Excel.Files

***Test Cases***
Read Csv File
    ${table}=    Read table from CSV    export.csv      header=True
    Log   Found columns: ${table.columns}
    ${rows}  ${columns}=    Get table dimensions    ${table}
    Log    Table has ${rows} rows and ${columns} columns.
    IF      ${rows} > 0
        FOR     ${row}  IN  ${table}
            Log     ${row}
        END
    ELSE
        Log     Ei löytynyt rivejä
    END