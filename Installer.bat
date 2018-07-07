@echo off
echo Create Temp...
if not exist C:\FSYSK mkdir C:\FSYSK 
copy *.* C:\FSYSK >NUL
echo {"passkeyLogger":"C:\\Users\\%Username%\\AppData\\Roaming\\fake syskey\\syskey_scammer_passwords.txt","messages":"C:\\Users\\%Username%\\AppData\\Roaming\\fake syskey\\messages.json"} > C:\FSYSK\settings.json
if not exist C:\FSYSK\syskey.exe goto ERRTEMP
if not exist "C:\FSYSK\Message Creator.exe" goto ERRTEMP
if not exist C:\FSYSK\UniversalControls.dll goto ERRTEMP
if not exist C:\FSYSK\messages.json goto ERRTEMP
if not exist C:\FSYSK\settings.json goto ERRTEMP
goto Setup

:ERRTEMP
echo Cannot create Temp. Exiting...
timeout /t 5 /nobreak >nul
exit

:setup
set mydir=%~dp0

Powershell -Command "& { Start-Process \"%mydir%FSYSK.bat\" -verb RunAs}"

