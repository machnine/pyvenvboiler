REM =======================================================================
REM ==                                                                   ==
REM ==  Create a new virtual environment using a boiler plate template   ==
REM ==                                                                   ==
REM =======================================================================

@echo off

REM check if a directory name is provided

if "%~1" == "" (
    echo Please provide a directory name ...
    goto ENDCOMMAND
) else (
    @echo Making a new python dev environment [%1] ...
    mkdir %1
    cd %1

    @echo Copying boiler plate files ... 

    copy ..\_pyvenvboiler\*.*

    @echo Creating a Python virtual environment ...
    python -m venv .env

    @echo Upgrade PIP to the latest version ...
    python -m pip install -U pip

    @echo Python dev environment [%1] is created.

)

:ENDCOMMAND
@echo on