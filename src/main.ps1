# Load configuration and validate
. "$PSScriptRoot\config\validator.ps1"

# Validate configuration before proceeding
if (-not (Test-Configuration)) {
    Write-Host "Configuration validation failed. Exiting..." -ForegroundColor Red
    Read-Host "Press Enter to exit"
    exit 1
}

# Load required modules
. "$PSScriptRoot\config\setting.ps1"
. "$PSScriptRoot\utils\send_whats.ps1"
. "$PSScriptRoot\utils\file_checker.ps1"

Write-Host "Starting file verification process..." -ForegroundColor Green

$limitDate = (Get-Date).ToString("dd/MM/yyyy", [System.Globalization.CultureInfo]::GetCultureInfo("es-ES"))

Test-FileChecker -paths $Global:paths -limitDate $limitDate

Write-Host "File verification completed. This message will disappear in 5 seconds." -ForegroundColor Green
Start-Sleep -Seconds 5
Clear-Host
