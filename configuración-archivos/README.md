### ⚠️ Nota sobre las modificaciones (GitHub Bypass)

Los archivos originales han sido modificados específicamente para poder subirse a GitHub por las siguientes razones:

*   **Ofuscación de Secretos:** Se eliminaron las URLs reales de los Webhooks (Slack/Teams) y claves de API. GitHub bloquea automáticamente la subida de archivos que contienen "hooks" activos por seguridad.
*   **Limpieza de IPs:** Se han reemplazado las direcciones IP privadas y públicas por marcadores de posición para evitar que el escáner de GitHub detecte exposición de infraestructura.
*   **Corrección de Sintaxis:** Se ajustó la estructura XML para asegurar que el motor de renderizado de GitHub identifique correctamente el formato del archivo.
