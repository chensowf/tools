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

echo Killing spiped
tskill spiped >NUL 2>NUL

REM if "%1" == "h" goto begin 
REM mshta vbscript:createobject("wscript.shell").run("%~nx0 h",2)(window.close)&&exit 
REM :begin

set work_dir=%~dp0
set PATH=%work_dir%\bin;%PATH%

:again
echo Stating Server spiped...
spiped -F -d -f -s 127.0.0.1:1195 -t 127.0.0.1:1194 -k %work_dir%/etc/spiped.key
echo Server spiped Exited...
goto again

pause