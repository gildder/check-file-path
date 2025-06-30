## 📋 Descripción

<!-- Proporciona una descripción clara y concisa de los cambios realizados -->

## 🔧 Tipo de Cambio

Marca todas las opciones que apliquen:

- [ ] 🐛 **Bug fix** - Corrige un problema existente
- [ ] ✨ **Nueva funcionalidad** - Agrega una nueva característica
- [ ] 💥 **Breaking change** - Cambio que rompe compatibilidad hacia atrás
- [ ] 📚 **Documentación** - Solo cambios en documentación
- [ ] 🎨 **Refactoring** - Cambios de código que no corrigen bugs ni agregan funcionalidades
- [ ] ⚡ **Mejora de rendimiento** - Cambios que mejoran el rendimiento
- [ ] 🧪 **Tests** - Agregar o corregir tests
- [ ] 🔧 **Configuración** - Cambios en configuración o scripts de build

## 🧪 Testing

- [ ] Los tests existentes pasan (`Invoke-Pester .\tests\`)
- [ ] Se agregaron nuevos tests para la funcionalidad
- [ ] Se probó manualmente en diferentes escenarios
- [ ] Se validó la configuración de `.env`

## 🔒 Checklist de Seguridad

- [ ] No se incluyen datos sensibles (números de teléfono, rutas específicas, etc.)
- [ ] Las nuevas variables están documentadas en `.env.example`
- [ ] Se agregaron validaciones de entrada si es necesario
- [ ] Se siguieron las buenas prácticas de seguridad

## 📝 Checklist de Calidad

- [ ] El código sigue los estándares de estilo del proyecto
- [ ] Se realizó self-review del código
- [ ] Los comentarios están en inglés (para código) o español (para documentación)
- [ ] La documentación fue actualizada si es necesario
- [ ] Los nombres de variables y funciones son descriptivos

## 🔗 Issues Relacionados

<!-- Referencia a issues que este PR cierra o relaciona -->
- Closes #(número del issue)
- Related to #(número del issue)

## 📸 Screenshots (si aplica)

<!-- Si los cambios incluyen interfaz de usuario o salida visual, incluir screenshots -->

## ⚙️ Configuración Adicional

<!-- ¿Requiere alguna configuración especial o pasos adicionales? -->

- [ ] Requiere actualizar `.env` 
- [ ] Requiere instalar nuevas dependencias
- [ ] Requiere actualizar ChromeDriver
- [ ] Requiere configuración adicional (especificar abajo)

**Pasos de configuración adicional:**
```
# Si hay pasos especiales, listarlos aquí
```

## 🚀 Deployment Notes

<!-- Notas especiales para deployment o uso en producción -->

## 📋 Testing Checklist

<!-- Para el reviewer: verificar estos puntos antes de aprobar -->

**Para el Reviewer:**
- [ ] El código es claro y fácil de entender
- [ ] Las funciones tienen una responsabilidad clara
- [ ] Se manejan apropiadamente los errores
- [ ] La documentación es adecuada
- [ ] Los tests cubren los casos importantes
- [ ] No hay hardcoded values
- [ ] Las variables de entorno están bien implementadas

## 🎯 Notas Adicionales

<!-- Cualquier información adicional que el reviewer deba saber -->

---

**Por favor, asegúrate de que todos los checks están marcados antes de solicitar review.** ✅
