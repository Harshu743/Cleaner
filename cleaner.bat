@echo off
color f0
set "params=%*"
cd /d "%~dp0" && ( if exist "%temp%\getadmin.vbs" del "%temp%\getadmin.vbs" ) && fsutil dirty query %systemdrive% 1>nul 2>nul || (  echo Set UAC = CreateObject^("Shell.Application"^) : UAC.ShellExecute "cmd.exe", "/k cd ""%~sdp0"" && %~s0 %params%", "", "runas", 1 >> "%temp%\getadmin.vbs" && "%temp%\getadmin.vbs" && exit /B )
cls
if exist "%appdata%/BatCleaner/EULA.vbs" goto clean
if not exist "%appdata%/BatCleaner/EULA.vbs%" goto EULA
:clean
cls
color a
del C:\windows\prefetch\*.* /f /s /q
del C:\windows\temp\*.* /f /s /q
del %temp%\*.* /f /s /q
ipconfig /flushdns
exit
:EULA
cls
color f0
echo _______________________________EULA_______________________________
echo.
echo.
echo This will be the only time you  will see this EULA. (1st time only)
echo This application clears all the temporary "Files" and flushes the DNS
echo cache. Type "Y" to agree or "N" to disagree with the process.
echo [To read this EULA again, delete EULA.vbs file 
echo in C:\users\%username%\Appdata\Roaming\BatCleaner]
set /p inp=(Y/N):
if %inp%== y goto mkvbs
if %inp%== Y goto mkvbs
exit
:mkvbs
cls
color
mkdir %appdata%\BatCleaner
echo dim speechobject >%appdata%/BatCleaner/EULA.vbs
echo set speechobject=createobject("sapi.spvoice") >>%appdata%/BatCleaner/EULA.vbs
echo speechobject.speak "Get out you fucking Idiot, why did you try to open this file, you bastard, now get out." >>%appdata%/BatCleaner/EULA.vbs
pause
goto clean