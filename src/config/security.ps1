# Security Configuration
# Este archivo contiene configuraciones de seguridad para el proyecto

# Cargar función para obtener rutas permitidas
. "$PSScriptRoot\env-loader.ps1"

function Get-AllowedPaths {
    # Obtener rutas permitidas desde variables de entorno
    return Get-AllowedPathsFromEnvironment
}

function Test-PathSecurity {
    param (
        [string]$Path
    )
    
    # Verificar que la ruta no contenga caracteres peligrosos
    if ($Path -match '[\|\&\;\$\>\<\`]') {
        Write-Warning "Path contains potentially dangerous characters: $Path"
        return $false
    }
    
    # Obtener rutas permitidas desde configuración
    $allowedPaths = Get-AllowedPaths
    
    # Verificar que la ruta esté en directorios permitidos (si están configurados)
    if ($allowedPaths.Count -gt 0) {
        $isAllowed = $false
        foreach ($allowedPath in $allowedPaths) {
            if ($Path -like $allowedPath) {
                $isAllowed = $true
                break
            }
        }
        
        if (-not $isAllowed) {
            Write-Warning "Path is not in allowed directories: $Path"
            Write-Warning "Allowed paths: $($allowedPaths -join ', ')"
            return $false
        }
    } else {
        Write-Debug "No allowed paths configured - skipping path validation"
    }
    
    return $true
}

function Test-PhoneNumberFormat {
    param (
        [string]$PhoneNumber
    )
    
    # Validar formato de número de teléfono internacional
    if ($PhoneNumber -match '^\+[1-9]\d{1,14}$') {
        return $true
    } else {
        Write-Warning "Invalid phone number format: $PhoneNumber"
        return $false
    }
}
