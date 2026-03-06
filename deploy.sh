#!/usr/bin/env bash
set -euo pipefail

RG="rg-tuglog-dev-eus2"
LOCATION="eastus2"

echo "==> Creating resource group (if not exists): $RG"
az group create --name "$RG" --location "$LOCATION" 1>/dev/null

echo "==> Deploying ARM template"
az deployment group create \
  --resource-group "$RG" \
  --template-file "./azuredeploy.json" \
  --parameters "./parameters_dev.json"

echo "==> Done."
echo ""
echo "Next steps:"
echo "  1. Create the DB connection string secret in Key Vault"
echo "  2. Build and push your Docker image to ACR"
echo "  3. Restart the Web App"