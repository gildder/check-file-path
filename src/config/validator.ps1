# Configuration Validator
# This script validates the environment configuration before running the main application

. "$PSScriptRoot\env-loader.ps1"
. "$PSScriptRoot\security.ps1"

function Test-Configuration {
    Write-Host "Validating configuration..." -ForegroundColor Yellow
    
    $isValid = $true
    
    # Load environment
    Load-Environment
    
    try {
        # Test file paths
        Write-Host "Checking file paths..." -ForegroundColor Cyan
        $paths = Get-PathsFromEnvironment
        
        if ($paths.Count -eq 0) {
            Write-Error "No file paths configured in FILE_PATHS environment variable"
            $isValid = $false
        } else {
            foreach ($path in $paths) {
                if (-not (Test-PathSecurity -Path $path)) {
                    $isValid = $false
                }
            }
            Write-Host "File paths validated: $($paths.Count) paths configured" -ForegroundColor Green
        }
        
        # Test phone numbers
        Write-Host "Checking phone numbers..." -ForegroundColor Cyan
        $numbers = Get-PhoneNumbersFromEnvironment
        
        if ($numbers.Count -eq 0) {
            Write-Error "No phone numbers configured in PHONE_NUMBERS environment variable"
            $isValid = $false
        } else {
            foreach ($number in $numbers) {
                if (-not (Test-PhoneNumberFormat -PhoneNumber $number)) {
                    $isValid = $false
                }
            }
            Write-Host "Phone numbers validated: $($numbers.Count) numbers configured" -ForegroundColor Green
        }
        
        # Test ChromeDriver path
        Write-Host "Checking ChromeDriver..." -ForegroundColor Cyan
        $chromeDriverPath = Get-EnvironmentVariable -Name "CHROME_DRIVER_PATH"
        
        if (-not (Test-Path $chromeDriverPath)) {
            Write-Error "ChromeDriver path does not exist: $chromeDriverPath"
            $isValid = $false
        } else {
            Write-Host "ChromeDriver path validated" -ForegroundColor Green
        }
        
        # Test Chrome profile directory
        Write-Host "Checking Chrome profile directory..." -ForegroundColor Cyan
        $profileDir = Get-EnvironmentVariable -Name "CHROME_PROFILE_DIR" -DefaultValue "C:\Temp\ChromeProfile"
        
        $parentDir = Split-Path $profileDir -Parent
        if (-not (Test-Path $parentDir)) {
            Write-Warning "Parent directory for Chrome profile does not exist: $parentDir"
            Write-Host "Creating parent directory..." -ForegroundColor Yellow
            New-Item -ItemType Directory -Path $parentDir -Force -ErrorAction SilentlyContinue
        }
        Write-Host "Chrome profile directory validated" -ForegroundColor Green
        
        # Test allowed paths configuration
        Write-Host "Checking security configuration..." -ForegroundColor Cyan
        $allowedPaths = Get-AllowedPathsFromEnvironment
        
        if ($allowedPaths.Count -eq 0) {
            Write-Host "No allowed paths configured - security validation will be skipped" -ForegroundColor Yellow
        } else {
            Write-Host "Security paths configured: $($allowedPaths.Count) allowed path patterns" -ForegroundColor Green
            Write-Debug "Allowed paths: $($allowedPaths -join ', ')"
        }
        
    } catch {
        Write-Error "Configuration validation failed: $_"
        $isValid = $false
    }
    
    if ($isValid) {
        Write-Host "Configuration validation successful!" -ForegroundColor Green
    } else {
        Write-Host "Configuration validation failed. Please check your .env file." -ForegroundColor Red
        Write-Host "Tip: Copy .env.example to .env and configure your settings" -ForegroundColor Yellow
    }
    
    return $isValid
}
