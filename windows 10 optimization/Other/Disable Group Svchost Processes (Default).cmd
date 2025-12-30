@echo off
setlocal
setlocal enabledelayedexpansion
if not "%~1"=="am_admin" (
    powershell -Command "Start-Process -Verb RunAs -FilePath '%~0' -ArgumentList 'am_admin'"
    exit /b
)




reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control" /v "SvcHostSplitThresholdInKB" /t REG_DWORD /d "3670016" /f


echo Finished, please reboot your device or login and log out for changes to apply.
pause
exit /b