# Importa el módulo a probar
. "$PSScriptRoot/../src/utils/file_checker.ps1"

Describe "CheckFiles Function Tests" {
    Context 'Testing file_checker.ps1' {
        $tempFilePaths = @(
            "$PSScriptRoot\temp_test_file1.txt"
        )

        BeforeAll {
            foreach ($path in $tempFilePaths) {
                New-Item -Path $path -ItemType File | Out-Null
            }
        }

        AfterAll {
            foreach ($path in $tempFilePaths) {
                if (Test-Path $path) {
                    Remove-Item -Path $path -Force
                }
            }
        }

        It "should alert if file does not exist" {
            $nonExistentPaths = @(
                "C:\test.txt"
            )

            $limitDate = (Get-Date).Date

            $global:alertMessage = ""
        
            Mock -CommandName sendAlert -MockWith { param ($message) $global:alertMessage = $message }


            CheckFiles -paths $nonExistentPaths -limitDate $limitDate

            $expectedFilePath = $nonExistentPaths[0]

            $expectedMessage = "The file at $expectedFilePath is created before the today."
            
            $global:alertMessage | Should be $expectedMessage
        }

        It "should alert if the file creation date is before the limit" {
            $limitDatePaths = @(
                "C:\currency.csv"
            )

            $futureDateLimit = (Get-Date).Date

            $global:alertMessage = ""

            Mock -CommandName sendAlert -MockWith { param ($message) $global:alertMessage = $message }


            CheckFiles -paths $limitDatePaths -limitDate $futureDateLimit

            $expectedFilePath = $limitDatePaths[0]

            $expectedMessage = "The file at $expectedFilePath is created before the today."

            $global:alertMessage | Should be $expectedMessage
        }
    }
}
