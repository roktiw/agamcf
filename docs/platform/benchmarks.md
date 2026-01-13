# Platform Benchmarks & Standards

This document defines the industry standards we align with and the specific metrics used to evaluate the maturity and quality of our Multicloud Vending Machine.

## 1. Industry Alignment

We do not reinvent the wheel. Our capabilities are benchmarked against established "Well-Architected" frameworks and enterprise patterns.

### Microsoft (Azure)
*   **Cloud Adoption Framework (CAF) & ALZ**: We adhere to the "Enterprise-Scale" architecture principles (Subscription democratization, Policy-driven governance).
*   **Azure Verified Modules (AVM)**: Our Terraform modules aim for parity with AVM standards.

### AWS
*   **Well-Architected Framework**: We map our capabilities to the 6 pillars (Operational Excellence, Security, Reliability, Performance, Cost, Sustainability).
*   **Control Tower / LZA**: Our "product space" concept mirrors the Account vending machine pattern.

### Google Cloud (GCP)
*   **Cloud Foundation Fabric**: We use the fabric approach for composable, blueprints-based architecture.
*   **Google Cloud Well-Architected**: Aligned with the 5 pillars of cloud excellence.

### Platform Engineering
*   **Internal Developer Portal (IDP)**: We benchmark against Backstage Software Templates for self-service experience.
*   **Drift Management**: We aim for "GitOps-style" reconciliation using Terraform/OpenTofu.

---

## 2. Platform Capability Metrics

We measure the success of the platform not just by "features" but by operational capabilities.

| Metric | How Measured | Target | Evidence in Repo | Tooling |
| :--- | :--- | :--- | :--- | :--- |
| **1. Time to Provision** | Time from PR Merge to fully ready Product Space (P95) | < 20 min | `docs/sizing.md` | GitHub Actions, Terraform |
| **2. Change Safety** | % of guardrails checked during `plan` (pre-apply) | 100% Policy Coverage | `.github/workflows/terraform-ci.yml` | TFLint, TFSec, Checkov |
| **3. Drift Rate** | Frequency of drift detection & Mean Time To Rectify (MTTR) | Zero unrecognized drift | `runbooks/drift.md` | Scheduled CI Actions |
| **4. Security Posture** | usage of long-lived credentials (keys/secrets) | 0 secrets (100% OIDC/WIF) | `main.tf` (backend config) | OIDC Federation |
| **5. Governance** | % of resources with mandatory tags & region compliance | 100% Enforced | `modules/*/variables.tf` | Azure Policy / Sentinel |
| **6. FinOps Maturity** | Visibility of cost drivers before deployment | Cost estimation in PR | `t-shirt-sizing.md` | Infracost (future), Tagging |
| **7. Operational Excellence** | Existence of standardized runbooks for failure scenarios | 100% coverage for Sev1 | `runbooks/` | MkDocs |
| **8. Portability Reality** | Clear documentation of "Footguns" and non-parity | documented feature gaps | `docs/cloud-equivalents.md` | `docs/` |
| **9. Developer Experience** | Number of mandatory inputs required from user | < 10 parameters | `contract/contract.md` | Terraform Variables |
| **10. Deprovision Cleanliness** | % of orphaned resources after destroy | 0 orphans | `runbooks/cleanup.md` | TF Destroy, Scripts |
