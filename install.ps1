# Installation and Setup Script
# This script helps users set up the project quickly and securely

param(
    [switch]$SkipDependencies,
    [switch]$Force
)

Write-Host "🚀 Check File Path - Installation Script" -ForegroundColor Cyan
Write-Host "=======================================" -ForegroundColor Cyan

# Check if running as Administrator
$isAdmin = ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")

if (-not $isAdmin) {
    Write-Warning "It's recommended to run this script as Administrator for proper module installation."
    $continue = Read-Host "Continue anyway? (y/N)"
    if ($continue -ne 'y' -and $continue -ne 'Y') {
        exit 1
    }
}

# Step 1: Check and install dependencies
if (-not $SkipDependencies) {
    Write-Host "📦 Installing PowerShell dependencies..." -ForegroundColor Yellow
    
    # Install Pester
    try {
        if (-not (Get-Module -Name Pester -ListAvailable) -or $Force) {
            Write-Host "Installing Pester module..." -ForegroundColor Cyan
            Install-Module -Name Pester -Force -SkipPublisherCheck -Scope CurrentUser
            Write-Host "✅ Pester installed successfully" -ForegroundColor Green
        } else {
            Write-Host "✅ Pester already installed" -ForegroundColor Green
        }
    } catch {
        Write-Error "Failed to install Pester: $_"
    }
    
    # Install Selenium
    try {
        if (-not (Get-Module -Name Selenium -ListAvailable) -or $Force) {
            Write-Host "Installing Selenium module..." -ForegroundColor Cyan
            Install-Module -Name Selenium -Scope CurrentUser -Force
            Write-Host "✅ Selenium installed successfully" -ForegroundColor Green
        } else {
            Write-Host "✅ Selenium already installed" -ForegroundColor Green
        }
    } catch {
        Write-Error "Failed to install Selenium: $_"
    }
}

# Step 2: Create environment configuration
Write-Host "🔧 Setting up environment configuration..." -ForegroundColor Yellow

$envPath = ".\.env"
$envExamplePath = ".\.env.example"

if (-not (Test-Path $envPath) -or $Force) {
    if (Test-Path $envExamplePath) {
        Copy-Item $envExamplePath $envPath
        Write-Host "✅ Environment template copied to .env" -ForegroundColor Green
        Write-Host "📝 Please edit .env file with your specific settings" -ForegroundColor Yellow
    } else {
        Write-Warning ".env.example not found. You'll need to create .env manually."
    }
} else {
    Write-Host "✅ .env file already exists" -ForegroundColor Green
}

# Step 3: Create necessary directories
Write-Host "📁 Creating necessary directories..." -ForegroundColor Yellow

$directories = @(
    "C:\Temp",
    "C:\Temp\ChromeProfile"
)

foreach ($dir in $directories) {
    if (-not (Test-Path $dir)) {
        try {
            New-Item -ItemType Directory -Path $dir -Force | Out-Null
            Write-Host "✅ Created directory: $dir" -ForegroundColor Green
        } catch {
            Write-Warning "Could not create directory: $dir - $_"
        }
    } else {
        Write-Host "✅ Directory already exists: $dir" -ForegroundColor Green
    }
}

# Step 4: Download ChromeDriver (optional)
$downloadChrome = Read-Host "Would you like guidance on downloading ChromeDriver? (y/N)"
if ($downloadChrome -eq 'y' -or $downloadChrome -eq 'Y') {
    Write-Host "🌐 ChromeDriver Download Instructions:" -ForegroundColor Cyan
    Write-Host "1. Visit: https://chromedriver.chromium.org/" -ForegroundColor White
    Write-Host "2. Download the version matching your Chrome browser" -ForegroundColor White
    Write-Host "3. Extract to C:\WebDriver\ (or update CHROME_DRIVER_PATH in .env)" -ForegroundColor White
    Write-Host "4. Make sure the path is included in your .env file" -ForegroundColor White
}

# Step 5: Final instructions
Write-Host ""
Write-Host "🎉 Installation completed!" -ForegroundColor Green
Write-Host "Next steps:" -ForegroundColor Yellow
Write-Host "1. Edit .env file with your specific settings" -ForegroundColor White
Write-Host "2. Ensure ChromeDriver is downloaded and path is configured" -ForegroundColor White
Write-Host "3. Run: .\src\main.ps1 to start the application" -ForegroundColor White
Write-Host ""
Write-Host "📚 For more information, see README.md" -ForegroundColor Cyan

Read-Host "Press Enter to finish"
