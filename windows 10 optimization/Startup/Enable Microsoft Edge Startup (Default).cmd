@echo off
setlocal

for /f "tokens=1" %%a in ('reg query "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\StartupApproved\Run" /v "MicrosoftEdgeAutoLaunch_*"') do (
    reg add "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\StartupApproved\Run" /v %%a /t REG_BINARY /d "020000000000000000000000" /f
)

echo Finished.
pause
exit /b