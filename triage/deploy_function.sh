#!/bin/bash

# Check if the correct number of arguments is provided
if [ "$#" -ne 3 ]; then
  echo "Usage: ./deploy_function.sh <resource-group> <function-app-name> <path-to-zip>"
  exit 1
fi

# Assign arguments to variables
RESOURCE_GROUP=$1
FUNCTION_APP_NAME=$2
ZIP_FILE_PATH=$3

# Execute the Azure CLI command to deploy the function code
az functionapp deployment source config-zip \
  --resource-group "$RESOURCE_GROUP" \
  --name "$FUNCTION_APP_NAME" \
  --src "$ZIP_FILE_PATH"

# Check if the deployment was successful
if [ $? -eq 0 ]; then
  echo "Deployment successful!"
else
  echo "Deployment failed!"
  exit 1
fi
