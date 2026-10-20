@echo off
rem Double-click to open the co-op port for hosting (asks for administrator rights).
rem "coop_firewall.bat remove" deletes the rule again.
powershell.exe -NoProfile -ExecutionPolicy Bypass -File "%~dp0coop_firewall.ps1" %*
