# Bestseller Repository Information
This repository provides a comprehensive solution for deploying and managing Azure infrastructure using Terraform, following best practices for security, modularity, and automation.

## Key Features

**Secure Remote State Management:** Terraform state is stored in Azure Blob Storage, configured via a remote backend to prevent exposure of sensitive data and ensure reliable state locking.

**Environment Separation:** Each environment has its own directory and state file, allowing independent management and deployment.

Re**usable Modules:** Common infrastructure components are defined as modules, making it easy to maintain and extend the codebase.

**Automated CI/CD Pipeline:** Infrastructure changes are validated, planned, and applied through a GitHub Actions workflow, ensuring consistency, auditability, and safe deployments.

**Manual Approval for Production:** The pipeline includes a manual approval step for production changes, reducing the risk of accidental modifications.

**Function Code Deployment:** Azure Functions code can be updated and deployed using the Azure CLI, streamlining application updates.

## Structure
The project is structured with separate directories for each environment (e.g., `prod`, `triage`), containing their respective Terraform configurations. Shared modules and resources are placed in a common `modules` directory for reuse across environments.

## Prerequisites

- [Terraform](https://www.terraform.io/downloads.html) >= 1.5
- [Azure CLI](https://learn.microsoft.com/en-us/cli/azure/install-azure-cli) authenticated with your account.
- Access to the remote backend storage (defined in `backend.tf`).


## Backend Configuration

The backend was manually created in the Azure Portal (Resource Group, Storage Account, and Container).  
Each environment (`prod`, `triage`) connects to the same storage backend using a different state file, configured via `backend.tf`.
Each engineer is responsible for setting up their own backend locally.

> ⚠️ This ensures all Terraform state is stored securely and consistently in Azure Blob Storage.


### Setting Up the Backend Locally

1. Set environment variables for Azure credentials:

  ```bash
  export ARM_CLIENT_ID="<YourClientID>"
  export ARM_CLIENT_SECRET="<YourClientSecret>"
  export ARM_SUBSCRIPTION_ID="<YourSubscriptionID>"
  export ARM_TENANT_ID="<YourTenantID>"
  ```

2. To configure the remote backend for your environment (`prod/`, `triage/`), create a `backend.tf` file on each of them and replace the placeholders with the defined Azure Resource Group, Storage Account, and Blob Storage Container names.

**Example `backend.tf` configuration:**

```hcl
terraform {
  backend "azurerm" {
    resource_group_name  = "<your-resource-group>"
    storage_account_name = "<your-storage-account>"
    container_name       = "<your-container>"
    key                  = "<your-env>.terraform.tfstate"
  }
}
```

3. Run `terraform init` from inside each environment directory (e.g., `prod/`, `triage/`) to initialize the backend and download required providers.

## CI/CD Deployment Strategy

All infrastructure deployments are handled through a GitHub Actions CI/CD pipeline. The pipeline runs automatically on pushes to the `main` branch and also supports manual triggering via the GitHub UI (`workflow_dispatch`). The workflow includes:

- **Linting with [TFLint](https://github.com/terraform-linters/tflint)**: validates Terraform code quality and detects potential issues early.
- **`terraform plan`**: generates and uploads a plan file for review.
- **Manual approval step**: the `apply` stage requires manual confirmation via GitHub environments to prevent accidental deployments.
- **Environment separation**: the pipeline is structured to handle both `triage` and `production` environments independently.
- **Safe deployments**: actual changes to infrastructure are only made from the `main` branch to ensure a stable release flow.

> ⚠️ **All changes to infrastructure must be deployed through the CI/CD pipeline.** Manual application of `terraform apply` is discouraged to ensure consistency, auditability, and proper state management.

The pipeline configuration can be found in `.github/workflows/terraform.yml`.

## Function Code Upload

The function code is uploaded using the Azure CLI. If you need to update or refactor the code, simply modify your source files and use the CLI command below to redeploy the updated package.

### On Both Environments:

```bash
az functionapp deployment source config-zip \
  --resource-group <YourResourceGroupName> \
  --name <YourFunctionAppName> \
  --src <PathToYourFunctionCode.zip>
```

## Future Improvements
To ensure the repository remains organized, modular, and robust as it evolves, consider the following future enhancements:

- Version and publish reusable modules from the `modules/` directory.
- Improve observability with logs, alerts, and monitoring for deployed resources.
- Enforce resource tagging policies