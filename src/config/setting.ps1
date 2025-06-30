# Load environment variables
. "$PSScriptRoot\env-loader.ps1"
Load-Environment

# File paths to verify (loaded from environment variables)
$Global:paths = Get-PathsFromEnvironment

# List of control telephones (loaded from environment variables)
$Global:numbers = Get-PhoneNumbersFromEnvironment

# Path of ChromeDriver (loaded from environment variables)
$Global:PathChromeDriver = Get-EnvironmentVariable -Name "CHROME_DRIVER_PATH"

# Path of batch file to execute on errors (optional)
$Global:BatchFilePath = Get-EnvironmentVariable -Name "BATCH_FILE_PATH" -DefaultValue ""

# Chrome profile directory
$Global:ChromeProfileDir = Get-EnvironmentVariable -Name "CHROME_PROFILE_DIR" -DefaultValue "C:\Temp\ChromeProfile"
