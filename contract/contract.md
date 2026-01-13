# 🤝 Platform Contract (Interface)

This document defines the **Standard Interface** that all "Product Space" modules (Azure, AWS, GCP) must implement. This abstraction allows developers to request resources using a consistent language, regardless of the underlying cloud provider.

## 1. Inputs (Variables)

These are the parameters that the Platform User (Developer) provides to the Vending Machine.

| Variable | Type | Description | Example |
| :--- | :--- | :--- | :--- |
| `product_code` | `string` | Short, unique identifier for the product/project. Used in naming. | `crm-api` |
| `environment` | `string` | Deployment environment (Lifecycle Stage). | `dev`, `test`, `prod` |
| `size` | `string` | T-Shirt size determining compute/storage capacity. | `small`, `medium`, `large` |
| `region` | `string` | Cloud provider region. | `Poland Central`, `eu-central-1` |
| `network_mode` | `string` | Networking isolation level. | `private` (default), `public` |
| `access_mode` | `string` | Application visibility. | `corporate-only` (Intranet), `public` (Internet) |
| `features` | `object` | Toggleable optional capabilities. | `{ observability = true, budgets = true }` |
| `tags` | `map` | Required governance metadata. | `{ Owner = "TeamX", CostCenter = "123" }` |

## 2. Outputs

These are the standardized values returned by the module, useful for Layer 2 (Workloads).

| Output | Type | Description |
| :--- | :--- | :--- |
| `resource_container_id` | `string` | The ID of the container holding resources (Resource Group ID, Project ID, Account ID). |
| `workspace_id` | `string` | ID of the centralized Log Analytics / Logging Workspace. |
| `primary_endpoint` | `string` | The main URL for the deployed workload (if applicable). |
| `network_id` | `string` | ID of the VNET / VPC where resources are deployed. |
| `identity_principal_id` | `string` | The Principal ID of the Managed Identity / IAM Role created for the app. |
| `deployment_metadata` | `map` | Metadata about the deployment (timestamp, version, cloud provider). |

## 3. Validation Rules

*   **product_code:** Max 10 chars, lowercase, alphanumeric.
*   **environment:** Must be one of `['dev', 'test', 'prod']`.
*   **tags:** Must contain `Owner`, `CostCenter`, `DataClass`.

## 4. Implementation Guide

Each cloud module (`modules/product-space-azure`, `modules/product-space-aws`, `modules/product-space-gcp`) MUST expose these exact variables. Cloud-specific implementation details are hidden within the module logic.
