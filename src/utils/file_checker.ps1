function File-Checker {
    param (
        [array]$paths,
        [datetime]$limitDate
    )

    
    foreach($path in $paths){
        if(Test-Path $path) {
            $creationDate = (Get-Item $path).CreationTime.Date
            if($creationDate -eq $limitDate) {
                Write-Output "The file at $path is created before the today."
            }else{
                Write-Output "The file at $path was created before the specified limit date."
                foreach($number in $Global:numbers){
                    New-WhatsMessage -number $number -message "The file at $path was created before the specified limit date."
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
