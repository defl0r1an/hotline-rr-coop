$ErrorActionPreference = "Stop"
$root = Resolve-Path (Join-Path $PSScriptRoot "..")
$gameDir = Join-Path $root "_work\game"
$distDir = Join-Path $root "_dist"
$zipPath = Join-Path $distDir "Hotline_Miami_Super_RR_Coop.zip"

Write-Host "Creating release archive..."
if (!(Test-Path $distDir)) {
    New-Item -ItemType Directory -Path $distDir | Out-Null
}
if (Test-Path $zipPath) {
    Remove-Item $zipPath -Force
}

# Temporary staging directory
$stageDir = Join-Path $distDir "Hotline_Miami_Super_RR_Coop"
if (Test-Path $stageDir) {
    Remove-Item $stageDir -Recurse -Force
}
New-Item -ItemType Directory -Path $stageDir | Out-Null

# Copy game files
Copy-Item (Join-Path $gameDir "*") $stageDir -Recurse -Force -Exclude "coop_log.txt","*.exp","*.lib"

# Copy Music files if source exists
$musicSrc = Join-Path $root "_backup_original\Music"
$musicDst = Join-Path $stageDir "Music"
if (Test-Path $musicSrc) {
    if (Test-Path $musicDst) { Remove-Item $musicDst -Force -Recurse -ErrorAction SilentlyContinue }
    New-Item -ItemType Directory -Path $musicDst | Out-Null
    Copy-Item (Join-Path $musicSrc "*") $musicDst -Recurse -Force
}

# Ensure clean default coop.ini
$cleanIni = @"
[coop]
; Host's address: its Tailscale IP (100.x.y.z), LAN IP, or 127.0.0.1 for two copies on one PC.
ip=
; UDP port. The host must allow it in Windows Firewall (Tailscale traffic usually passes).
port=27515
; Name shown to your partner.
name=Player
; 1 = keep the game windowed (handy for two copies on one PC).
windowed=0
; host / join = start the session automatically at boot instead of pressing F7 / F8.
auto=
; Test only: extra latency in ms and packet loss in % for packets this PC sends.
netsim_lag=0
netsim_loss=0
"@
Set-Content (Join-Path $stageDir "coop.ini") $cleanIni -Encoding ASCII

# Zip the stage folder using .NET ZipFile
Write-Host "Compressing to $zipPath..."
Add-Type -AssemblyName System.IO.Compression.FileSystem
[System.IO.Compression.ZipFile]::CreateFromDirectory($stageDir, $zipPath, [System.IO.Compression.CompressionLevel]::Optimal, $false)

# Cleanup stage dir
Remove-Item $stageDir -Recurse -Force
Write-Host "Release package ready: $zipPath"
