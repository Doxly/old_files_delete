REM This script would delete all files for given mask, except given count,
REM acording modification date

REM for ability to modify variables inside blocks for and if
SETLOCAL enableDelayedExpansion

@echo off

SET file_mask="logfile*.log"
SET files_to_stay=10

SET /a Counter=0
FOR /f "tokens=1" %%i IN ('DIR /B /O-D "%file_mask%"') DO (
    REM First files skip, others delete
    SET /A Counter+=1
    rem echo "DEBUG: counter | files_to_stay :" !Counter! "|" %files_to_stay%
    IF !Counter! LEQ %files_to_stay% (
        echo "%%i" - stayed
    ) ELSE (
        echo "%%i" - would deleted
    )
)
