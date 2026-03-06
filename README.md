# Despliegue de Infraestructura - TugLog

## Requisitos

- **Azure CLI** 2.50+ 
- Permisos de **Contributor** en la suscripción

### Instalar Azure CLI (Windows)

```powershell
winget install Microsoft.AzureCLI
```

Reinicia la terminal después de instalar. Verifica con `az --version`.

## Archivos

| Archivo | Descripción |
|---------|-------------|
| `azuredeploy.json` | Template ARM que define todos los recursos de Azure a crear (Web App, SQL, Key Vault, etc.) |
| `parameters_dev.json` | Valores específicos del ambiente (nombres, contraseñas, configuraciones) |

## Pasos

### 1. Login en Azure

```bash
az login
```

Se abrirá el navegador para autenticarte. Después verás las suscripciones disponibles:

```
No     Subscription name    Subscription ID                       Tenant
-----  -------------------  ------------------------------------  ----------------
[1] *  ACP - Dev            suscrpcionejemplodev                  Tenant a Elegir
[2]    ACP - Sandbox        abc12345ejemplo                       Tenant a Elegir
```

Escribe el número de la suscripción deseada y presiona Enter.

### 2. Ir a la carpeta del proyecto

```bash
cd C:\ruta\donde\estan\los\archivos
```

Asegúrate de que estén `azuredeploy.json`, `parameters_dev.json` y `deploy.sh` en esa carpeta.

### 3. Crear Resource Group

```bash
az group create --name "<NOMBRE_RESOURCE_GROUP>" --location "eastus2"
```

### 4. Desplegar Infraestructura

```bash
az deployment group create \
  --resource-group "<NOMBRE_RESOURCE_GROUP>" \
  --template-file "azuredeploy.json" \
  --parameters "parameters_dev.json"
```

## Recursos Creados

| Recurso | Nombre |
|---------|--------|
| Container Registry | acr-opap-dev-eus2-001 |
| App Service Plan | asp-opap-dev-eus2-001 |
| Web App | app-tuglog-dev-eus2-001 |
| Key Vault | kv-opap-dev-eus2-001 |
| SQL Server | sql-opap-dev-eus2-001 |
| SQL Database | tuglog-dev-db |
| Data Factory | adf-opap-dev-eus2-001 |
