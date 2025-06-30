<h1 align="center">Check File Path</h1>

<!-- <h4 align="center"> 
	🚧  Check File Path 🚀 Under construction...  🚧
</h4> 

<hr> -->

<p align="center">
  <a href="#dart-about">About</a> &#xa0; | &#xa0; 
  <a href="#sparkles-features">Features</a> &#xa0; | &#xa0;
  <a href="#rocket-technologies">Technologies</a> &#xa0; | &#xa0;
  <a href="#white_check_mark-requirements">Requirements</a> &#xa0; | &#xa0;
  <a href="#checkered_flag-starting">Starting</a> &#xa0; | &#xa0;
  <a href="#memo-license">License</a> &#xa0; | &#xa0;
  <a href="https://github.com/gilberet@hotmail.com" target="_blank">Author</a>
</p>

<br>

## :dart: About ##

Trata de controla la creacion de archivos y si estos fue creados el dia de hoy, en caso no cumplir esa 2 directices envias mensaje por WhatsApp.

## :sparkles: Features ##

:heavy_check_mark: Verificar si un archivo existe\
:heavy_check_mark: Verificar si el archivo fue credo el dia de hoy\
:heavy_check_mark: Enviar mensaje por WhatsApp

## :rocket: Technologies ##

The following tools were used in this project:

- [PowerShell](https://www.powershellgallery.com/)
- [Pester](https://pester.dev/)
- [Selenium](https://www.selenium.dev/)

## :white_check_mark: Requirements ##

Before starting :checkered_flag:, you need to have [Git](https://git-scm.com) installed.

## :checkered_flag: Starting ##

```powershell
# Clone this project
$ git clone https://github.com/gildder/check-file-path

# Access
$ cd check-file-path

# Configure environment variables
$ cp .env.example .env
# Edit .env file with your specific settings

# Install dependencies
$ Install-Module -Name Pester -Force -SkipPublisherCheck
$ Install-Module -Name Selenium -Scope CurrentUser

## 🔧 Configuration ##

This project uses environment variables for secure configuration. Follow these steps:

### 1. Environment Setup

Copy the example environment file and configure it:

```bash
cp .env.example .env
```

### 2. Edit .env file

Configure the following variables in your `.env` file:

```env
# File paths to verify (comma-separated)
FILE_PATHS=C:\path\to\file1.csv,C:\path\to\file2.txt

# Phone numbers for WhatsApp notifications (comma-separated, international format)
PHONE_NUMBERS=+1234567890,+0987654321

# ChromeDriver path (download from https://chromedriver.chromium.org/ or https://googlechromelabs.github.io/chrome-for-testing/#stable)
CHROME_DRIVER_PATH=C:\WebDriver

# Optional: Batch file to execute on errors
BATCH_FILE_PATH=C:\path\to\script.bat

# Chrome profile directory
CHROME_PROFILE_DIR=C:\Temp\ChromeProfile

# Security: Allowed paths for file validation (comma-separated, use * for wildcards)
ALLOWED_PATHS=C:\YourProject\*,C:\Temp\*,C:\WebDriver\*
```

### 3. Security Features

- ✅ **Environment Variables**: Sensitive data is stored in `.env` files
- ✅ **Git Ignore**: `.env` files are excluded from version control
- ✅ **Path Validation**: Built-in security checks for file paths with configurable allowed directories
- ✅ **Phone Number Validation**: Format validation for phone numbers
- ✅ **Template Configuration**: `.env.example` provides setup guidance
- ✅ **Configurable Security**: Security policies are configurable via environment variables

### 4. Running the Project

```powershell
# Navigate to source directory
$ cd src/

# Run the main script
$ .\main.ps1
```

## 🧪 Testing ##

```powershell
# Run all tests
$ Invoke-Pester .\tests\

# Run specific test
$ Invoke-Pester .\tests\file_checker.test.ps1
```

## 🤝 Contributing ##

Please read [CONTRIBUTING.md](CONTRIBUTING.md) for details on our code of conduct and the process for submitting pull requests.

## 🔒 Security ##

Please read our [Security Policy](SECURITY.md) for information about reporting security vulnerabilities.

## 📝 Changelog ##

See [Releases](https://github.com/gildder/check-file-path/releases) for a list of changes in each version.

```

## :memo: License ##

This project is under license from MIT. For more details, see the [LICENSE](LICENSE.md) file.


Made with :heart: by <a href="https://github.com/gildder" target="_blank">Gildder</a>

&#xa0;

<a href="#top">Back to top</a>
