# Builds SuperRRCoop.dll, patches a clean copy of data.win and assembles a playable test folder.
# The original game folder and _backup_original are never modified.
$ErrorActionPreference = "Stop"
$root = Split-Path -Parent $PSScriptRoot
$game = Join-Path $root "Super R-R"
$backup = Join-Path $root "_backup_original"
$work = Join-Path $root "_work"
$out = Join-Path $work "game"

& cmd /c (Join-Path $PSScriptRoot "dll\build.bat")
if ($LASTEXITCODE -ne 0) { throw "DLL build failed" }

New-Item -ItemType Directory -Force $work | Out-Null
$cli = Join-Path $root "_tools\utmt_cli\UndertaleModCli.exe"
$patched = Join-Path $work "data.win"
& cmd /c "`"$cli`" load `"$backup\data.win`" -s `"$PSScriptRoot\patch\ApplyCoop.csx`" -o `"$patched`" -f < NUL"
if ($LASTEXITCODE -ne 0 -or !(Test-Path $patched)) { throw "patching failed" }

New-Item -ItemType Directory -Force $out | Out-Null
Get-ChildItem $backup -File | Where-Object { $_.Name -ne "data.win" } | Copy-Item -Destination $out -Force
Copy-Item $patched (Join-Path $out "data.win") -Force
Copy-Item (Join-Path $PSScriptRoot "dll\build\SuperRRCoop.dll") $out -Force
Copy-Item (Join-Path $PSScriptRoot "dist\*") $out -Force  # firewall helper for the host
if (!(Test-Path (Join-Path $out "Music"))) {
    # Junction instead of a copy: the music is read-only for the game.
    & cmd /c mklink /J "`"$(Join-Path $out "Music")`"" "`"$(Join-Path $game "Music")`"" | Out-Null
}
if (!(Test-Path (Join-Path $out "coop.ini"))) {
    Copy-Item (Join-Path $PSScriptRoot "coop.ini.example") (Join-Path $out "coop.ini")
}
Write-Host "Test build ready in $out"
