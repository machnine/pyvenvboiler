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
    @echo:
    @echo [7;37mPlease provide a directory name ...[0m
    @echo:
    goto ENDCOMMAND
)

:: if folder not exitsts - make one
if not exist %1\ ( 
    @echo [45mCreating a new directory [%1] ...[0m    
    mkdir %1
    @echo [45mFolder %1 created ...[0m

) else (
    REM if foler exists - choose what to do next    
    @echo [7;37mFolder %1 exists ...[0m        
    @echo:
    @echo 1. Delete and renew [45m[%1\.env][0m only
    @echo 2. Delete and renew the whole [45m[%1][0m folder
    @echo 3. Exit
    
    choice /c 123 /n /m "Choose an action [1-3]:"    
    
    if ERRORLEVEL 3 goto ENDCOMMAND 
    if ERRORLEVEL 2 goto DELETE_ALL
    if ERRORLEVEL 1 goto DELETE_ENV   
   
)

:RESUME_PROC
cd %1

@echo [44mCreating a Python virtual environment ...[0m
python -m venv .env
@echo [7;37mPython dev environment [0m[45m[%1][0m[7;37m is created ...[0m
@echo [45mUpgrade PIP to the latest version ...[0m    
.env\Scripts\python.exe -m pip install -U pip
@echo [45mInstall packages for VSCode ...[0m
.env\Scripts\pip.exe install flake8 black


choice /c yn /n /m "Copy boiler plate files [Y/N]:?"
 
if ERRORLEVEL 2 goto ACCOMPLISHED
  
@echo [44mCopying boiler plate files ... [0m
copy ..\_pyvenvboiler\*.*
goto ACCOMPLISHED




:DELETE_ENV
@echo [7;37mDeleting[0m[45m[%1\.env][0m[7;37m ...[0m
rmdir %1\.env /s/q
goto RESUME_PROC

:DELETE_ALL
@echo [7;37mDeleting folder [0m[45m[%1][0m[7;37m ...[0m
rmdir %1 /s/q
mkdir %1
@echo [7;37mCreating folder [0m[45m[%1][0m[7;37m ...[0m
goto RESUME_PROC


:ACCOMPLISHED
cd ..
@echo:
@echo [44mMission accomplished ...[0m
@echo:
:ENDCOMMAND
@echo on



