. "$PSScriptRoot/config/setting.ps1"
. "$PSScriptRoot/utils/send_whats.ps1"
. "$PSScriptRoot/utils/file_checker.ps1"

$limitDate = (Get-Date).ToString("dd/MM/yyyy", [System.Globalization.CultureInfo]::GetCultureInfo("es-ES"))


File-Checker -paths $Global:paths -limitDate $limitDate

Write-Output "Finalizo la verificacion. Este mensaje desaparecerá en 5 segundos."
Start-Sleep -Seconds 5
Clear-Host
