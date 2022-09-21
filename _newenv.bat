:: =======================================================================
:: ==                                                                   ==
:: ==  Create a new virtual environment using a boiler plate template   ==
:: ==                                                                   ==
:: =======================================================================
::
:: ESC character -> Alt + 027
:: 
::
::
@echo off

:: check if a directory name is provided

if "%~1" == "" (
    @echo [7;37mPlease provide a directory name ...[0m
    goto ENDCOMMAND
) else (
    @echo [45mMaking a new python dev environment [%1] ...[0m
    mkdir %1
    cd %1
    @echo [44mCopying boiler plate files ... [0m
    copy ..\_pyvenvboiler\*.*
    @echo [44mCreating a Python virtual environment ...[0m
    python -m venv .env
    @echo Python dev environment [45m[%1] [0mis created.
    @echo [45mUpgrade PIP to the latest version ...[0m    
    .env\Scripts\python.exe -m pip install -U pip
    @echo [45mInstall packages for VSCode ...[0m
    .env\Scripts\pip.exe install pyflakes pycodestyle flake8 black

)

:ENDCOMMAND
@echo on