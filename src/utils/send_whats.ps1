Import-Module Selenium

function Send-Message {
    param (
        [string]$number,
        [string]$message
    )

    $numberFormat = $number -replace '\+', '' 

    try {
        Write-Host "Navigating to WhatsApp chat..."
        $Driver.Navigate().GoToUrl("https://web.whatsapp.com/send?phone=$numberFormat&text=$([uri]::EscapeDataString($message))")

        # Use WebDriverWait to wait until the message field is visible
        Add-Type -AssemblyName "WebDriver.Support"
        $wait = New-Object OpenQA.Selenium.Support.UI.WebDriverWait($Driver, [TimeSpan]::FromSeconds(120))
        $wait.Until([OpenQA.Selenium.Support.UI.ExpectedConditions]::ElementExists([OpenQA.Selenium.By]::XPath("//div[@aria-placeholder='Escribe un mensaje' and @contenteditable='true']")))

        # Find the message field
        $messageBox = $Driver.FindElementByXPath("//div[@aria-placeholder='Escribe un mensaje' and @contenteditable='true']")
        
        # Write the message in the text field
        Write-Host "Typing message in text field..."
        $Driver.ExecuteScript("arguments[0].innerText = arguments[1];", $messageBox, $message)
        Start-Sleep -Seconds 5

        # Use JavaScript to fire the "Enter" event
        Write-Host "Send the message with JavaScript event..."
        $Driver.ExecuteScript("var event = new KeyboardEvent('keydown', {key: 'Enter', code: 'Enter', keyCode: 13, which: 13}); arguments[0].dispatchEvent(event);", $messageBox)
        Start-Sleep -Seconds 5

        Write-Host "Message sending process completed."
    } catch {
        Write-Host "Could not send message to $number. Error: $_"
    }
}

function New-WhatsMessage {
    param (
        [string]$number,
        [string]$message
    )
    
    $driverPath = $Global:PathChromeDriver

    # Configure the ChromeDriver service
    $service = [OpenQA.Selenium.Chrome.ChromeDriverService]::CreateDefaultService($driverPath)    # Configure Chrome options
    $chromeOptions = New-Object OpenQA.Selenium.Chrome.ChromeOptions
    $chromeOptions.AddArgument("--headless")
    $chromeOptions.AddArgument("--disable-gpu")
    $chromeOptions.AddArgument("--user-data-dir=$($Global:ChromeProfileDir)")

    try {
        $Driver = New-Object OpenQA.Selenium.Chrome.ChromeDriver($service, $chromeOptions)
        Write-Host "Browser started."
        $Driver.Navigate().GoToUrl("https://web.whatsapp.com/")
        Write-Host "Navigation to WhatsApp Web completed. Scan the QR code to log in."

        Start-Sleep -Seconds 45

        # Send WhatsApp message
        Send-Message -number $number -message $message
    } catch {
        Write-Host "Error al iniciar el navegador o cargar la página: $_"
    } finally {
        if ($Driver) { $Driver.Quit() }
    }

}