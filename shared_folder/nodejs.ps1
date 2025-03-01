# Description: This script installs Node.js and npm using NVM for Windows.
# Usage: Run the script in a PowerShell session with administrative privileges.
# Reference: https://github.com/coreybutler/nvm-windows/wiki#manual-installation

# Parameters
$nvm_version = "1.1.11"
$nvm_uri = "https://github.com/coreybutler/nvm-windows/releases/download/$nvm_version/nvm-noinstall.zip"
$nvm_architecture = "64"
$nvm_directory = "$env:APPDATA\nvm"
$nvm_symlink = "C:\Program Files\nodejs"
$node_version = "10.24.1"

# Download the NVM package
Invoke-WebRequest -Uri $nvm_uri -OutFile "$env:USERPROFILE\Downloads\nvm-noinstall.zip"
# Extract the NVM package to AppData
Expand-Archive -Path "$env:USERPROFILE\Downloads\nvm-noinstall.zip" -DestinationPath $nvm_directory
# Add NVM to the system PATH
[Environment]::SetEnvironmentVariable("NVM_HOME", $nvm_directory, "Machine")
[Environment]::SetEnvironmentVariable("NVM_SYMLINK", $nvm_symlink, "Machine")
[Environment]::SetEnvironmentVariable("Path", "$([System.Environment]::GetEnvironmentVariable("Path","Machine"));$nvm_directory;$nvm_symlink", "Machine")
[Environment]::SetEnvironmentVariable("NVM_HOME", $nvm_directory, "User")
[Environment]::SetEnvironmentVariable("NVM_SYMLINK", $nvm_symlink, "User")
[Environment]::SetEnvironmentVariable("Path", "$([System.Environment]::GetEnvironmentVariable("Path","User"));$nvm_directory;$nvm_symlink", "User")
# Write setting.txt file to NVM directory
$contentToAdd = @"
root: $nvm_directory
path: $nvm_symlink
arch: $nvm_architecture
proxy: none
"@
Add-Content "$nvm_directory\settings.txt" $contentToAdd
# Refresh the environment variables
$env:Path = [System.Environment]::GetEnvironmentVariable("Path","Machine") + ";" + [System.Environment]::GetEnvironmentVariable("Path","User")
# Install Node.js LTS version
nvm install $node_version
# Set the default Node.js version
nvm use $node_version
# Install essential windows build tools. Reference: https://github.com/Microsoft/nodejs-guidelines/blob/master/windows-environment.md#environment-setup-and-configuration
npm install -g windows-build-tools
# Install yarn
npm install -g yarn
