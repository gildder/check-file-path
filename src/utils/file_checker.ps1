function File-Checker {
    param (
        [array]$paths,
        [string]$limitDate
    )

    $errorFound = $false
    
    foreach($path in $paths){
        if(Test-Path $path) {
            $fileInfo = Get-Item $path
            if($fileInfo.Length -eq 0){
                Write-Output "The file at $path exists but is empty (0 bytes)."
                foreach($number in $Global:numbers){
                    New-WhatsMessage -number $number -message "The file at $path exists but is empty (0 bytes)."
                }
                $errorFound = $true
            }else {
                $creationDate = Get-DateFile -FilePath $path

                if($creationDate -eq $limitDate) {
                    Write-Output "The file at $path is created today."
                }else{
                    Write-Output "The file at $path was created before the specified limit date of $limitDate."
                    foreach($number in $Global:numbers){
                        New-WhatsMessage -number $number -message "The file at $path was created before the specified limit date of $limitDate."
                    }
                    $errorFound = $true
                }
            }
        } else {
            Write-Output "The file at $path does not exist."
            foreach($number in $Global:numbers){
                New-WhatsMessage -number $number -message "The file at $path does not exist."
            }
            $errorFound = $true
        }
    }    # Executar file batch 
    if($errorFound) {
        $batchPath = $Global:BatchFilePath
        if(![string]::IsNullOrEmpty($batchPath) -and (Test-Path $batchPath)) {
            Write-Output "Executing batch file due to errors found..."
            Start-Process -FilePath $batchPath -Wait
        } else {
            if(![string]::IsNullOrEmpty($batchPath)) {
                Write-Output "Batch file not found at $batchPath"
            } else {
                Write-Debug "No batch file configured"
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