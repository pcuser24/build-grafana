# Description: This script downloads and installs Git for Windows in silent mode.
# Usage: Run the script in a PowerShell session with administrative privileges.
# Reference: https://git-scm.com/download/win

# Parameters
$gitArchitecture = (Get-CimInstance Win32_operatingsystem).OSArchitecture
$gitVersion = "2.48.1"
$installerPath = "$env:USERPROFILE\Downloads\Git-$gitVersion-$gitArchitecture.exe"
$installerUri = "https://github.com/git-for-windows/git/releases/download/v$gitVersion.windows.1/Git-$gitVersion-$gitArchitecture.exe"

# Download the Git installer
Invoke-WebRequest -Uri $installerUri -OutFile $installerPath

# Run the installer in silent mode with specified installation directory
Start-Process -FilePath $installerPath -ArgumentList "/SILENT", "/NORESTART", "/DIR=""C:\Program Files\Git""" -Wait -NoNewWindow
