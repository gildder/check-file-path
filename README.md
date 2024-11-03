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

# Install dependencies
$ Install-Module -Name Pester -Force -SkipPublisherCheck

$ Install-Module -Name Selenium -Scope CurrentUser

## Configuración del Script

# File paths to check (replace with actual path)
$Global:paths = @("YOUR_PATH_HERE")

# List of control phones (replaces with actual numbers)
$Global:numbers = @("+123456789")

# ChromeDriver path (replaces with actual path)
$Global:PathChromeDriver = "YOUR_CHROME_DRIVER_PATH_HERE"

# Run the project
$ cd src/

$ .\main.ps1

```

## :memo: License ##

This project is under license from MIT. For more details, see the [LICENSE](LICENSE.md) file.


Made with :heart: by <a href="https://github.com/gildder" target="_blank">Gildder</a>

&#xa0;

<a href="#top">Back to top</a>
