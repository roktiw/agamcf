# 🗺️ Cloud Equivalents Map

This document serves as a "Rosetta Stone" for teams working in a multi-cloud environment. It demonstrates how Azure components map to their equivalents in AWS and GCP.

| Category (Component) | 🟦 Azure Component | 🟧 AWS Component | 🟩 GCP Component | ⭐️ Criticality |
| :--- | :--- | :--- | :--- | :--- |
| **Product Group** | Resource Group | Resource Group / Account | Project | ⭐⭐⭐⭐⭐ |
| **Compute (PaaS)** | App Service / ACA | Elastic Beanstalk / Fargate | App Engine / Cloud Run | ⭐⭐⭐⭐ |
| **Compute (K8s)** | AKS | EKS | GKE | ⭐⭐⭐⭐⭐ |
| **Object Storage** | Blob Storage | S3 Bucket | Cloud Storage | ⭐⭐⭐⭐⭐ |
| **Block Storage** | Managed Disk | EBS Volume | Persistent Disk | ⭐⭐⭐ |
| **Database (SQL)** | Azure SQL Database | RDS for SQL Server | Cloud SQL | ⭐⭐⭐⭐ |
| **Identity** | Entra ID (Managed ID) | IAM Role | IAM Service Account | ⭐⭐⭐⭐⭐ |
| **Secrets** | Key Vault | Secrets Manager | Secret Manager | ⭐⭐⭐⭐⭐ |
| **Serverless** | Azure Functions | AWS Lambda | Cloud Functions | ⭐⭐⭐ |

---

> [!NOTE]
> **TPO Note:** "In this project, we focus on the Azure column, but the module architecture (inputs/outputs) is designed to easily plug in AWS/GCP backends under the same developer interface in the future."
