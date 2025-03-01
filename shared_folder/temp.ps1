$nvm_version = "1.2.2"
$nvm_package_uri = "https://github.com/coreybutler/nvm-windows/releases/download/$nvm_version/nvm-noinstall.zip"
$nvm_architecture = "64"
$nvm_directory = "$env:APPDATA\nvm"

# Write setting.txt file to NVM directory
[Environment]::SetEnvironmentVariable("NVM_HOME", $nvm_directory, "User")
[Environment]::SetEnvironmentVariable("NVM_SYMLINK", "C:\Program Files\nodejs", "User")
[Environment]::SetEnvironmentVariable("Path", "$Env:Path;%NVM_HOME%;%NVM_SYMLINK%", "User")

golang.org/x/xerrors v0.0.0-20190528162220-0421b64034aa

https://gnuwin32.sourceforge.net/packages/make.htm
