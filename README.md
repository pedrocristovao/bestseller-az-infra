# Project Name

## Overview
This project uses Terraform to deploy infrastructure to Azure, with a securely configured remote backend to avoid exposing sensitive data.

## Backend Configuration

### Backend Setup
The backend is created manually in Azure Console to prevent exposing sensitive credentials:

- **Storage Account Name**: `<YourStorageAccountName>`
- **Container Name**: `<YourContainerName>`
- **Backend Key (Prod)**: `<YourProdBackendKey>`
- **Backend Key (Triage)**: `<YourTriageBackendKey>`

#### Setting Up the Backend Locally

1. Create a `backend.tf` file:

  ```hcl
  terraform {
    backend "azurerm" {
     resource_group_name   = "<YourResourceGroupName>"
     storage_account_name  = "<YourStorageAccountName>"
     container_name        = "<YourContainerName>"
     key                   = "<YourBackendKey>"
    }
  }
  ```

2. Set environment variables for Azure credentials:

  ```bash
  export ARM_CLIENT_ID="<YourClientID>"
  export ARM_CLIENT_SECRET="<YourClientSecret>"
  export ARM_SUBSCRIPTION_ID="<YourSubscriptionID>"
  export ARM_TENANT_ID="<YourTenantID>"
  ```

3. Run `terraform init` to initialize Terraform with the backend.

---

## Function Code Upload

The function code for each environment is uploaded via Azure CLI:

### Production Environment

