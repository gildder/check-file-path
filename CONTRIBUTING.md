# Contributing to Check File Path

¡Gracias por tu interés en contribuir! 🎉

## 🚀 Cómo Contribuir

### 1. Fork y Clone
```bash
# Fork el repositorio en GitHub
# Luego clona tu fork
git clone https://github.com/tu-usuario/check-file-path.git
cd check-file-path
```

### 2. Configurar Entorno
```powershell
# Ejecutar script de instalación
.\install.ps1

# Configurar variables de entorno
cp .env.example .env
# Editar .env con tus configuraciones de prueba
```

### 3. Crear Branch
```bash
git checkout -b feature/nueva-funcionalidad
# o
git checkout -b fix/correccion-bug
```

## 📋 Estándares de Código

### PowerShell Style Guide
- **Nombres**: PascalCase para funciones, camelCase para variables
- **Comentarios**: Usar `#` para comentarios de línea
- **Indentación**: 4 espacios
- **Líneas**: Máximo 120 caracteres

### Ejemplo:
```powershell
function Get-FileStatus {
    param (
        [Parameter(Mandatory=$true)]
        [string]$FilePath
    )
    
    if (Test-Path $FilePath) {
        return "File exists"
    } else {
        return "File not found"
    }
}
```

## 🧪 Testing

### Ejecutar Tests
```powershell
# Instalar Pester si no está instalado
Install-Module -Name Pester -Force -SkipPublisherCheck

# Ejecutar todos los tests
Invoke-Pester .\tests\

# Ejecutar test específico
Invoke-Pester .\tests\file_checker.test.ps1
```

### Escribir Tests
```powershell
Describe "Nueva Funcionalidad" {
    Context "Cuando se cumple condición X" {
        It "Debería hacer Y" {
            # Arrange
            $input = "test-value"
            
            # Act
            $result = Mi-Funcion -Parameter $input
            
            # Assert
            $result | Should -Be "expected-value"
        }
    }
}
```

## 🔒 Seguridad

### Información Sensible
- ❌ **NUNCA** incluir números de teléfono reales
- ❌ **NUNCA** incluir rutas de archivos específicas
- ❌ **NUNCA** incluir credenciales
- ✅ **SIEMPRE** usar `.env.example` para ejemplos

### Variables de Entorno
```powershell
# ❌ Incorrecto
$phoneNumber = "+1234567890"

# ✅ Correcto
$phoneNumber = Get-EnvironmentVariable -Name "PHONE_NUMBERS"
```

## 📝 Commit Messages

### Formato
```
tipo(scope): descripción breve

Descripción detallada si es necesaria

- Cambio específico 1
- Cambio específico 2
```

### Tipos
- `feat`: Nueva funcionalidad
- `fix`: Corrección de bug
- `docs`: Cambios en documentación
- `style`: Formato, punto y coma, etc.
- `refactor`: Refactoring de código
- `test`: Agregar o corregir tests
- `chore`: Mantenimiento

### Ejemplos
```bash
feat(whatsapp): agregar soporte para mensajes con imágenes
fix(validator): corregir validación de números internacionales
docs(readme): actualizar instrucciones de instalación
```

## 🔄 Pull Request Process

### 1. Checklist Antes de PR
- [ ] Tests pasan (`Invoke-Pester`)
- [ ] Código sigue estándares de estilo
- [ ] Documentación actualizada
- [ ] No hay información sensible
- [ ] Variables están en `.env`

### 2. Descripción del PR
```markdown
## 📋 Descripción
Breve descripción de los cambios

## 🔧 Tipo de Cambio
- [ ] Bug fix
- [ ] Nueva funcionalidad
- [ ] Breaking change
- [ ] Documentación

## 🧪 Testing
- [ ] Tests existentes pasan
- [ ] Nuevos tests agregados
- [ ] Probado manualmente

## 📝 Checklist
- [ ] Código sigue estándares
- [ ] Documentación actualizada
- [ ] No información sensible
```

## 🐛 Reportar Bugs

### Template de Issue
```markdown
**Descripción del Bug**
Descripción clara del problema

**Pasos para Reproducir**
1. Ir a '...'
2. Hacer clic en '...'
3. Ver error

**Comportamiento Esperado**
Lo que esperabas que pasara

**Screenshots**
Si aplica, agregar screenshots

**Entorno:**
- OS: [Windows 10/11]
- PowerShell: [5.1/7.x]
- Versión del proyecto: [1.0]
```

## 💡 Sugerir Funcionalidades

### Template de Feature Request
```markdown
**¿Está relacionado con un problema?**
Descripción del problema

**Solución Propuesta**
Descripción de la solución

**Alternativas Consideradas**
Otras opciones evaluadas

**Contexto Adicional**
Información extra relevante
```

## 🏷️ Labels de Issues

- `bug`: Algo no funciona
- `enhancement`: Nueva funcionalidad
- `documentation`: Mejoras en docs
- `good first issue`: Bueno para principiantes
- `help wanted`: Se necesita ayuda
- `security`: Relacionado con seguridad

## 📞 Obtener Ayuda

- **Issues**: Para bugs y features
- **Discussions**: Para preguntas generales
- **Email**: Para temas de seguridad

## 🎉 Reconocimiento

Los contribuidores serán añadidos al README en la sección de agradecimientos.

¡Gracias por ayudar a mejorar el proyecto! 🚀
