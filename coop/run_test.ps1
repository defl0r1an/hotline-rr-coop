param(
    [int]$HostLevel = 121,
    [int]$TestAuto = 1,
    [string]$TestTarget = "",
    [int]$DurationSec = 22
)

$ErrorActionPreference = "Stop"
$root = Resolve-Path (Join-Path $PSScriptRoot "..")
$hostDir = Join-Path $root "_work\game"
$clientDir = Join-Path $root "_work\game_client"
$exeName = "Hotline Miami Super R-R.exe"

Write-Host "Syncing game_client..."
Copy-Item (Join-Path $hostDir "data.win") (Join-Path $clientDir "data.win") -Force
Copy-Item (Join-Path $hostDir "SuperRRCoop.dll") (Join-Path $clientDir "SuperRRCoop.dll") -Force

# Setup Host coop.ini
$hostIni = @"
[coop]
ip=
port=27515
name=Host
windowed=1
auto=host
test_level=$HostLevel
test_auto=$TestAuto
test_target=$TestTarget
netsim_lag=0
netsim_loss=0
"@
Set-Content (Join-Path $hostDir "coop.ini") $hostIni -Encoding ASCII

# Setup Client coop.ini
$clientIni = @"
[coop]
ip=127.0.0.1
port=27515
name=Client
windowed=1
auto=join
test_auto=$TestAuto
test_target=$TestTarget
netsim_lag=0
netsim_loss=0
"@
Set-Content (Join-Path $clientDir "coop.ini") $clientIni -Encoding ASCII

# Remove old logs
Remove-Item (Join-Path $hostDir "coop_log.txt") -ErrorAction SilentlyContinue
Remove-Item (Join-Path $clientDir "coop_log.txt") -ErrorAction SilentlyContinue

Write-Host "Starting Host and Client processes..."
$hostProc = Start-Process -FilePath (Join-Path $hostDir $exeName) -WorkingDirectory $hostDir -PassThru
Start-Sleep -Milliseconds 800
$clientProc = Start-Process -FilePath (Join-Path $clientDir $exeName) -WorkingDirectory $clientDir -PassThru

Write-Host "Running test for $DurationSec seconds (Host PID $($hostProc.Id), Client PID $($clientProc.Id))..."
Start-Sleep -Seconds $DurationSec

Write-Host "Stopping processes..."
Stop-Process -Id $hostProc.Id -Force -ErrorAction SilentlyContinue
Stop-Process -Id $clientProc.Id -Force -ErrorAction SilentlyContinue
Start-Sleep -Seconds 1

Write-Host "--- HOST LOG ---"
if (Test-Path (Join-Path $hostDir "coop_log.txt")) {
    Get-Content (Join-Path $hostDir "coop_log.txt") | Select-Object -Last 35
} else {
    Write-Host "No host log found!"
}

Write-Host "--- CLIENT LOG ---"
if (Test-Path (Join-Path $clientDir "coop_log.txt")) {
    Get-Content (Join-Path $clientDir "coop_log.txt") | Select-Object -Last 35
} else {
    Write-Host "No client log found!"
}
