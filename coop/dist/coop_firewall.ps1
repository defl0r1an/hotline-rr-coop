# Opens (or closes) the co-op UDP port in Windows Firewall for the player who hosts.
# Only traffic from virtual-LAN VPN addresses is allowed: Tailscale 100.64.0.0/10,
# Radmin VPN 26.0.0.0/8, Hamachi 25.0.0.0/8.
#   coop_firewall.ps1           create / refresh the rule
#   coop_firewall.ps1 remove    delete the rule
#   coop_firewall.ps1 -DryRun   only show what would be done
param(
    [string]$Action = "add",
    [switch]$DryRun
)

$RuleName = "Super R-R Co-op"
$RemoteAddresses = @("100.64.0.0/10", "26.0.0.0/8", "25.0.0.0/8")

function Get-CoopPort {
    $ini = Join-Path $PSScriptRoot "coop.ini"
    if (Test-Path $ini) {
        foreach ($line in Get-Content $ini) {
            if ($line -match '^\s*port\s*=\s*(\d+)\s*$') { return [int]$Matches[1] }
        }
    }
    return 27515
}

function Finish([int]$code) {
    Write-Host ""
    Read-Host "Нажми Enter, чтобы закрыть окно" | Out-Null
    exit $code
}

$port = Get-CoopPort

if ($DryRun) {
    Write-Host "Будет удалено правило '$RuleName' (если есть)."
    if ($Action -ne "remove") {
        Write-Host "Будет создано правило '$RuleName': входящий UDP-порт $port, только с адресов $($RemoteAddresses -join ', ')."
    }
    exit 0
}

$isAdmin = ([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole(
    [Security.Principal.WindowsBuiltInRole]::Administrator)
if (-not $isAdmin) {
    # Restart elevated: Windows shows its usual UAC prompt.
    try {
        Start-Process -FilePath "powershell.exe" -Verb RunAs -ArgumentList @(
            "-NoProfile", "-ExecutionPolicy", "Bypass", "-File", "`"$PSCommandPath`"", $Action)
    } catch {
        Write-Host "Нужны права администратора — запуск отменён." -ForegroundColor Red
        Finish 1
    }
    exit 0
}

try {
    Get-NetFirewallRule -DisplayName $RuleName -ErrorAction SilentlyContinue | Remove-NetFirewallRule
    if ($Action -eq "remove") {
        Write-Host "Правило '$RuleName' удалено. Хостить кооп с этого ПК больше не получится." -ForegroundColor Yellow
        Finish 0
    }
    New-NetFirewallRule -DisplayName $RuleName -Direction Inbound -Protocol UDP -LocalPort $port `
        -Action Allow -Profile Any -RemoteAddress $RemoteAddresses | Out-Null
    Write-Host "Готово: UDP-порт $port открыт для партнёров через Tailscale / Radmin VPN / Hamachi." -ForegroundColor Green
    Write-Host "Теперь можно хостить: главное меню -> CO-OP -> HOST GAME."
    Finish 0
} catch {
    Write-Host "Не получилось изменить брандмауэр: $($_.Exception.Message)" -ForegroundColor Red
    Finish 1
}
