:: Get cmd args by lik173

@echo off
if "%~1"=="" goto getinf
if "%~2"=="" goto argget
goto arggetout
:getinf
echo %~0 {PID} [outfile]
echo.
set /p PID=Your PID: 
set /p outfile=Out file (optional): 

if %PID% GEQ 0 goto get
echo ERROR! Try again

if "%outfile%"=="" goto get
goto getout
:get
wmic.exe path Win32_Process where handle='%PID%' get Commandline /format:list

goto a
:getout
wmic.exe path Win32_Process where handle='%~1' get Commandline /format:list> %outfile%
goto a


:argget
wmic.exe path Win32_Process where handle='%~1' get Commandline /format:list
goto a

:arggetout
wmic.exe path Win32_Process where handle='%~1' get Commandline /format:list> %~2
goto a

:a