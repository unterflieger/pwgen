@echo off
title Password Generator PLUS by unterflieger
echo Password Generator PLUS by unterflieger
echo(
pause
md %userprofile%\AppData\com.pwgen.unterflieger\
cd %userprofile%\AppData\com.pwgen.unterflieger\
:menu
del tmp.b64
cls
echo 1) Create Password
echo 2) Show Password
echo 3) Delete Password
echo 4) Show created passwords in folder
echo 5) Visit my website
echo 6) More information
echo 7) Exit
set /p menuopt=Type option: 
if "%menuopt%"=="1" goto create
if "%menuopt%"=="2" goto show
if "%menuopt%"=="3" goto delpw
if "%menuopt%"=="4" goto folder
if "%menuopt%"=="5" goto website
if "%menuopt%"=="6" goto info
if "%menuopt%"=="7" exit
goto menu
exit

:info
cls
echo                          PwGenPlus
echo                        PROJECT SECURE
echo.
echo          The Password is saved in an encrypted state,
echo        so it cant be read by opening the file in notepad.
echo The Password is getting decrypted for milliseconds to read the file,
echo           and gets encrypted to secure the Password.
pause
goto menu

:delpw
set /p pwdel=Which password do you want to delete? ("[name]-[program]"): 
del %pwdel%.b64
goto menu
:show
cls
set /p pwshow=Name of password ("[name]-[program]"): 
cls
certutil -decode %pwshow%.b64 %pwshow%.txt
cls
echo The password %pwshow% is: 
type %pwshow%.txt
pause
certutil -encode %pwshow%.txt tmp.b64 && findstr /v /c:- tmp.b64 > %pwshow%.b64
del %pwshow%.txt
cls
goto menu

:folder
start %userprofile%\AppData\com.pwgen.unterflieger\
goto menu

:website
::start https://unterflieger.000webhostapp.com/
start https://unterflieger.github.io/
goto menu
:create
set /p pwname=Please name the password (only Letters): 
cls
set /p pwprog=What is the password for? (only Letters): 
cls
:rept
cls
echo How many digits should the password have?
echo 1) 5 Digits
echo 2) 10 Digits
echo 3) 15 Digits
set /p pwlength=Type option: 
if "%pwlength%"=="1" goto length5
if "%pwlength%"=="2" goto length10
if "%pwlength%"=="3" goto length15
goto rept
:length5
echo nul> %pwname%-%pwprog%.txt
echo %RANDOM:~-1%%RANDOM:~-1%%RANDOM:~-1%%RANDOM:~-1%%RANDOM:~-1% > %pwname%-%pwprog%.txt
certutil -encode %pwname%-%pwprog%.txt tmp.b64 && findstr /v /c:- tmp.b64 > %pwname%-%pwprog%.b64
del %pwname%-%pwprog%.txt
cls
echo Your password was created and secured.
pause
goto menu
:length10
echo nul> %pwname%-%pwprog%.txt
echo %RANDOM:~-1%%RANDOM:~-1%%RANDOM:~-1%%RANDOM:~-1%%RANDOM:~-1%%RANDOM:~-1%%RANDOM:~-1%%RANDOM:~-1%%RANDOM:~-1%%RANDOM:~-1% > %pwname%-%pwprog%.txt
certutil -encode %pwname%-%pwprog%.txt tmp.b64 && findstr /v /c:- tmp.b64 > %pwname%-%pwprog%.b64
del %pwname%-%pwprog%.txt
cls
echo Your password was created and secured.
pause
goto menu
:length15
echo nul> %pwname%-%pwprog%.txt
echo %RANDOM:~-1%%RANDOM:~-1%%RANDOM:~-1%%RANDOM:~-1%%RANDOM:~-1%%RANDOM:~-1%%RANDOM:~-1%%RANDOM:~-1%%RANDOM:~-1%%RANDOM:~-1%%RANDOM:~-1%%RANDOM:~-1%%RANDOM:~-1%%RANDOM:~-1%%RANDOM:~-1% > %pwname%-%pwprog%.txt
certutil -encode %pwname%-%pwprog%.txt tmp.b64 && findstr /v /c:- tmp.b64 > %pwname%-%pwprog%.b64
del %pwname%-%pwprog%.txt
cls
echo Your password was created and secured.
pause
goto menu