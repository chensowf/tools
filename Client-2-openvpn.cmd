@rem ----[ This code block detects if the script is being running with admin PRIVILEGES If it isn't it pauses and then quits]-------
@echo OFF
NET SESSION >nul 2>&1
IF %ERRORLEVEL% EQU 0 (
    ECHO Administrator PRIVILEGES Detected! 
) ELSE (
   echo ######## ########  ########   #######  ########  
   echo ##       ##     ## ##     ## ##     ## ##     ## 
   echo ##       ##     ## ##     ## ##     ## ##     ## 
   echo ######   ########  ########  ##     ## ########  
   echo ##       ##   ##   ##   ##   ##     ## ##   ##   
   echo ##       ##    ##  ##    ##  ##     ## ##    ##  
   echo ######## ##     ## ##     ##  #######  ##     ## 
   echo.
   echo.
   echo ####### ERROR: ADMINISTRATOR PRIVILEGES REQUIRED #########
   echo This script must be run as administrator to work properly!  
   echo If you're seeing this after clicking on a start menu icon, then right click on the shortcut and select "Run As Administrator".
   echo ##########################################################
   echo.
   PAUSE
   EXIT /B 1
)
@echo ON

@echo off

echo Killing openvpn
tskill openvpn >NUL 2>NUL


REM if "%1" == "h" goto begin 
REM mshta vbscript:createobject("wscript.shell").run("%~nx0 h",2)(window.close)&&exit 
REM :begin

set work_dir=%~dp0
set PATH=%work_dir%\bin;%PATH%

set username=%random%%random%%random%
set password=%random%%random%%random%

echo %username% > %work_dir%\etc\openvpn\auth.txt
echo %password% >> %work_dir%\etc\openvpn\auth.txt

:again
echo Stating Client openvpn...
openvpn --cd %work_dir%\etc\openvpn --config client.ovpn --auth-user-pass %work_dir%\etc\openvpn\auth.txt --log %work_dir%\var\client.log
echo Client openvpn Exited...
goto again

pause
