@echo off
color A
goto begin
 
:usage
echo Usage: %~n0
echo.

echo "Starting DocuLib 1.4f+ ..."
echo and waits for user to press a key to stop.
goto end

:begin
if not "%1"=="" goto usage
cd server
start "Apache server" /high /B "C:\dokuwiki\server\mapache.exe"

CALL:ECHOVER "- DocuLib is starting..."
:ECHOVER
%Windir%\System32\WindowsPowerShell\v1.0\Powershell.exe write-host -foreground white -background green %1
echo v1.4f+ [2023-01-18] - (c) sp808

echo --------------------------------+

echo DO NOT CLOSE THIS WINDOW 
CALL:ECHONOCLOSE "DO NOT CLOSE THIS WINDOW"
:ECHONOCLOSE
%Windir%\System32\WindowsPowerShell\v1.0\Powershell.exe write-host -foreground black -background red %1
echo --------------------------------+
echo.

:runbrowser
echo Initialization... 
echo.

CALL:ECHOSITE "Application will be available at:" 
:ECHOSITE
%Windir%\System32\WindowsPowerShell\v1.0\Powershell.exe write-host -foreground black -background cyan %1

CALL:ECHOSITE " http://localhost:8800"
:ECHOSITE
%Windir%\System32\WindowsPowerShell\v1.0\Powershell.exe write-host -foreground black -background cyan %1

echo.
echo Opening default browser...
echo ------------------------------------------------------------------------+
echo.
echo.   - Minimal system requirements: i3 / 2Gb RAM
echo.   - Recommended system requirements: i5 / 4Gb RAM + SSD
echo.   - Operating system: Windows 7 / [Linux is possible]
echo.   - Browser: Firefox 78 ESR and up
echo.
echo ------------------------------------------------------------------------+
echo.

if exist ..\dokuwiki\conf\local.php (
	start http://localhost:8800/
) else (
	start http://localhost:8800/install.php
)
 
:wait
CALL:ECHOCLOSE "TO CLOSE THE PROGRAM PRESS ANY OR CLICK [X]"
:ECHOCLOSE
%Windir%\System32\WindowsPowerShell\v1.0\Powershell.exe write-host -foreground white -background red %1

pause > nul
 
:stop
cls
ApacheKill.exe
echo.
echo ... DokuLib is stopped
echo.

CALL:ECHOCLOSE2 "YON CAN CLOSE THE WINDOW"
:ECHOCLOSE2
%Windir%\System32\WindowsPowerShell\v1.0\Powershell.exe write-host -foreground white -background red %1

echo.
echo ----------------------------------------------------------------+

timeout /t 5
exit
:end