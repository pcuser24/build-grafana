
# Download the tdm-gcc installer
$tdm_gcc_installer_uri = "https://github.com/jmeubank/tdm-gcc/releases/download/v10.3.0-tdm64-2/tdm64-gcc-10.3.0-2.exe"
$tdm_installer_path = "$env:USERPROFILE\Downloads\tdm64-gcc-10.3.0-2.exe"
Invoke-WebRequest -Uri $tdm_gcc_installer_uri -OutFile $tdm_installer_path
# MANUALLY: Invoke the installer

# MANUALLY: donwload GNU Make for Windows
# Add GNU Make binary path to the system PATH, replacing the existing value with the actual path set when installing GNU Make
$gnu_path = "C:\Program Files (x86)\GnuWin32"
[Environment]::SetEnvironmentVariable("Path", "$([System.Environment]::GetEnvironmentVariable("Path","Machine"));$gnu_path\bin", "Machine")
