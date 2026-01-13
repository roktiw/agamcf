# ADR-001: Hybrid Infrastructure as Code Strategy

*   **Status:** Accepted
*   **Date:** 2026-01-13
*   **Context:** The platform requires both a stable networking foundation (managed by Platform Team) and agile application deployment capability (managed by Product Teams).

## Decision
We have decided to adopt a **Hybrid IaC approach** utilizing **Terraform** for the core platform layer and **Bicep** for the application overlay.

## Rationale
*   **Terraform** excels at state management for "slow-moving" resources like VNETs, Peerings, and Policies. Its cross-cloud providers allow us to maintain a unified networking strategy across Azure, AWS, and GCP.
*   **Bicep** provides "Day 0" support for Azure features, making it ideal for the "fast-moving" application layer (App Service, Functions, AI services) where developers often need the latest capabilities immediately.

## Consequences
### Positive
*   ➕ **Specialization:** Uses the best tool for the specific domain (NetOps vs DevOps).
*   ➕ **Speed:** Bicep modules deploy significantly faster (no state locking overhead) for app updates.
*   ➕ **Abstraction:** Developers interact with simple Bicep parameters, hidden from complex Terraform networking logic.

### Negative
*   ➖ **Complexity:** The team requires competence in two IaC languages (HCL and Bicep).
*   ➖ **Drift Management:** Requires disciplined CI/CD pipelines to ensure Terraform changes don't accidentally overwrite Bicep resource groups (mitigated by Resource Group locking).

## Compliance
This decision aligns with the "Serviceability" pillar by decoupling the platform lifecycle from the application lifecycle.
