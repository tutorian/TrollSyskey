@echo off

cd C:\Windows\System32
goto Menu

:menu
cls
title SYSKEY Fake Installer ^| TutoInstaller
set Autor=Tutorian
set line======================================
echo.
echo   SYSKEY Fake Installer
echo                          Made by %Autor%
echo %line%
echo.
echo  What do you want?
set menu=0
set /p menu="Install / Uninstall: "
if %menu%==Install goto Install
if %menu%==install goto Install
if %menu%==Uninstall goto Uninstall
if %menu%==uninstall goto uninstall
goto Menu

:Install 
echo Create Backup Folder...
mkdir C:\Windows\System32\SyskeyBackup >NUL

if not exist C:\Windows\System32\SyskeyBackup (
mkdir C:\Windows\System32\SyskeyBackup >NUL
)
if errorlevel 1 (
echo Folder cannot be created. Please check if you execute this with Administrator Permissions. 
timeout /t 5 /nobreak >nul
exit
)

echo Copy Syskey.exe to Backup Folder...
copy SYSKEY.exe C:\Windows\System32\SyskeyBackup >NUL
if not exist C:\Windows\System32\SyskeyBackup\Syskey.exe (
copy C:\Windows\System32\Syskey.exe C:\Windows\System32\SyskeyBackup >NUL
)
if errorlevel 1 (
echo File cannot be saved. Please check if you execute this with Administrator Permissions.
timeout /t 5 /nobreak >nul
exit
)

echo Deleting Syskey.exe...
if exist C:\Windows\System32\SyskeyBackup\syskey.exe del C:\Windows\System32\Syskey.exe >NUL

if exist C:\Windows\System32\Syskey.exe (
if exist C:\Windows\System32\SyskeyBackup\syskey.exe del C:\Windows\System32\Syskey.exe >NUL
)
if errorlevel 1 (
echo File cannot be saved / deleted. Please check if you execute this with Administrator Permissions.
timeout /t 5 /nobreak >nul
exit
)

echo Copy new Files...
copy C:\FSYSK\UniversalControlls.dll C:\Windows\System32 >nul
copy C:\FSYSK\Syskey.exe C:\Windows\System32 >NUL
copy "C:\FSYSK\Message Creator.exe" C:\Windows\System32 >NUL
if not exist C:\Windows\System32\syskey.exe (
echo New File (C:\Windows\System32\syskey.exe) not found. Exiting...
timeout /t 5 /nobreak >nul
exit
)

if not exist "C:\Windows\System32\Message Creator.exe" (
echo New File (C:\Windows\System32\Message Creator.exe) not found. Exiting...
timeout /t 5 /nobreak >nul
exit
)

if not exist C:\Windows\System32\UniversalControlls.dll (
echo New File (C:\Windows\System32\UniversalControlls.dll) not found. Exiting...
timeout /t 5 /nobreak
exit
)
mkdir "%appdata%\fake syskey"
copy C:\FSYSK\message.json "%appdata%\fake syskey" >NUL
copy C:\FSYSK\settings.json "%appdata%\fake syskey" >NUL

echo Installation completed!
timeout /t 5 /nobreak >nul
exit

:uninstall
echo Deleting old Files..
del C:\Windows\System32\Syskey.exe >NUL
del C:\Windows\System32\Syskey.exe >NUL
del C:\Windows\System32\Syskey.exe >NUL
echo Copy new Files...
copy C:\Windows\System32\SyskeyBackup\syskey.exe C:\Windows\System32
if not exist C:\Windows\system32\syskey.exe (
echo Cannot restore Syskey.exe! Please do it manually.
timeout /t 5 /nobreak >nul
exit
)
echo Uninstallation completed!
timeout /t 5 /nobreak >nul
exit
