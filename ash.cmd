@echo off
chcp 437

for /f "delims=[] tokens=2 " %%i in ( 'ver ') do set MyVer=%%i
for /f "tokens=2 " %%i in ( 'echo %MyVer% ') do set MyVer=%%i
for /f "tokens=1,2,3 delims=. " %%i in ( 'echo %MyVer% ') do (
set MajorVer=%%i
set MinorVer=%%j
set BuildNum=%%k
)

set PATH=%cd%\bin;%PATH%

if %MajorVer% GTR 5 (
	.\bin\busybox-nt6plus.exe ash -l
) ELSE (
	.\bin\busybox.exe ash -l
)

pause
