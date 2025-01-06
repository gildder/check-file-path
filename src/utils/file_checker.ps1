function File-Checker {
    param (
        [array]$paths,
        [string]$limitDate
    )

    
    foreach($path in $paths){
        if(Test-Path $path) {
            $creationDate = Get-DateFile -FilePath $path

            if($creationDate -eq $limitDate) {
                Write-Output "The file at $path is created today."
            }else{
                Write-Output "The file at $path was created before the specified limit date of $limitDate."
                foreach($number in $Global:numbers){
                    New-WhatsMessage -number $number -message "The file at $path was created before the specified limit date of $limitDate."
                }
            }
        } else {
            Write-Output "The file at $path does not exist."
            foreach($number in $Global:numbers){
                New-WhatsMessage -number $number -message "The file at $path does not exist."
            }
        }
    }
}

function Get-DateFile {
    param (
        [Parameter(Mandatory=$true)]
        [string]$FilePath
    )

    $file = Get-Item $FilePath
    Write-Debug "Param $FilePath"

    if ($file.LastWriteTime -ne $null) {
        $finalDate = $file.LastWriteTime.ToString("dd/MM/yyyy", [System.Globalization.CultureInfo]::GetCultureInfo("es-ES"))
    } else {
        $finalDate = $file.CreationTime.ToString("dd/MM/yyyy", [System.Globalization.CultureInfo]::GetCultureInfo("es-ES"))
    }

    return $finalDate    
}