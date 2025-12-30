@echo off
setlocal
if not "%~1"=="am_admin" (
    powershell -Command "Start-Process -Verb RunAs -FilePath '%~0' -ArgumentList 'am_admin'"
    exit /b
)


powershell -NoP -NonI "[Environment]::SetEnvironmentVariable('POWERSHELL_TELEMETRY_OPTOUT', '', 'Machine')"


echo.
echo Finished.
echo Press any key to exit...
pause > nul
exit /b