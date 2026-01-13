# 💰 T-Shirt Sizing System (FinOps)

This document defines the standard "Product Space" sizes available to development teams, along with their estimated monthly costs (East US 2 region).

| T-Shirt Size | Environment | Compute SKU | Storage Redundancy | Cost Estimate (Approx.) | Use Case |
| :--- | :--- | :--- | :--- | :--- | :--- |
| **Small (S)** | DEV | B1 (Basic) | LRS (Local) | **$12 / mo** | Prototyping, Individual development |
| **Medium (M)** | TEST | P1v3 (Premium) | LRS (Local) | **$85 / mo** | Integration testing, UAT |
| **Large (L)** | PROD | P3v3 (Premium) | GRS (Global) | **$240 / mo** | Production workloads, High Availability |

---

> [!TIP]
> **FinOps Strategy:** Defaulting to "Small" for all non-production environments saves ~95% of compute costs compared to "Large".

## Cost Breakdown (Per Component)

### Small (Developer Tier)
*   **App Service Plan (B1):** ~$12.41
*   **Storage (LRS):** ~$0.02 (negligible)
*   **Key Vault:** Standard tier (per transaction)

### Medium (Standard Tier)
*   **App Service Plan (P1v3):** ~$83.22
*   **Storage (LRS):** ~$0.05
*   **Private Endpoint Data:** ~$1.50 (varies by traffic)

### Large (Enterprise Tier)
*   **App Service Plan (P3v3):** ~$233.00
*   **Storage (GRS):** ~$0.10
*   **App Insights:** Data ingestion costs (~$2.30/GB)
