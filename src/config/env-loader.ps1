function Load-Environment {
    param (
        [string]$EnvFilePath = "$PSScriptRoot\..\..\.env"
    )
    
    if (Test-Path $EnvFilePath) {
        Write-Host "Loading environment variables from $EnvFilePath"
        
        Get-Content $EnvFilePath | Where-Object { $_ -match '^\s*[^#].*=' } | ForEach-Object {
            $key, $value = $_ -split '=', 2
            $key = $key.Trim()
            $value = $value.Trim()
            
            # Remove quotes if present
            if ($value.StartsWith('"') -and $value.EndsWith('"')) {
                $value = $value.Substring(1, $value.Length - 2)
            }
            
            [System.Environment]::SetEnvironmentVariable($key, $value, 'Process')
            Write-Debug "Set environment variable: $key"
        }
    } else {
        Write-Warning "Environment file not found at $EnvFilePath"
        Write-Warning "Please copy .env.example to .env and configure your settings"
    }
}

function Get-EnvironmentVariable {
    param (
        [string]$Name,
        [string]$DefaultValue = ""
    )
    
    $value = [System.Environment]::GetEnvironmentVariable($Name, 'Process')
    if ([string]::IsNullOrEmpty($value)) {
        if (![string]::IsNullOrEmpty($DefaultValue)) {
            return $DefaultValue
        } else {
            throw "Environment variable '$Name' is required but not set. Please check your .env file."
        }
    }
    return $value
}

function Get-PathsFromEnvironment {
    $pathsString = Get-EnvironmentVariable -Name "FILE_PATHS"
    return $pathsString -split ',' | ForEach-Object { $_.Trim() }
}

function Get-PhoneNumbersFromEnvironment {
    $numbersString = Get-EnvironmentVariable -Name "PHONE_NUMBERS"
    return $numbersString -split ',' | ForEach-Object { $_.Trim() }
}

function Get-AllowedPathsFromEnvironment {
    $allowedPathsString = Get-EnvironmentVariable -Name "ALLOWED_PATHS" -DefaultValue ""
    if ([string]::IsNullOrEmpty($allowedPathsString)) {
        return @()
    }
    return $allowedPathsString -split ',' | ForEach-Object { $_.Trim() }
}
