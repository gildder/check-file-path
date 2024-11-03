. "$PSScriptRoot/config/setting.ps1"
. "$PSScriptRoot/utils/send_whats.ps1"
. "$PSScriptRoot/utils/file_checker.ps1"


File-Checker -paths $Global:paths -limitDate (Get-Date).Date
