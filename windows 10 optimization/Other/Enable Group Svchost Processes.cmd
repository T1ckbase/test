@echo off
setlocal
setlocal enabledelayedexpansion
if not "%~1"=="am_admin" (
    powershell -Command "Start-Process -Verb RunAs -FilePath '%~0' -ArgumentList 'am_admin'"
    exit /b
)

set command="powershell -command (Get-CimInstance -ClassName Win32_PhysicalMemory | Measure-Object -Property Capacity -Sum).Sum / 1kb"
for /f %%a in ('powershell -command %command%') do set result=%%a

if !result! gtr 0 (
    echo Total memory: !result! KB
    reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control" /v "SvcHostSplitThresholdInKB" /t REG_DWORD /d !result! /f
) else (
    echo Failed.
    pause
    exit /b
)


echo Finished, please reboot your device or login and log out for changes to apply.
pause
exit /b