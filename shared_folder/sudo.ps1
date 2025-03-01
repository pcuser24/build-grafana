$script = "C:\shared_folder\temp.ps1"
Start-Process -Verb RunAs powershell.exe -ArgumentList "-ExecutionPolicy Bypass -File $script"
