# ADR-0001: Infrastructure Layering Strategy

*   **Status:** Accepted
*   **Date:** 2026-01-13
*   **Context:**
    Monolithic infrastructure codebases become unmaintainable as they grow. We need a strategy to separate the lifecycle of "slow-moving" platform components from "fast-moving" application workloads, ensuring that changes to one do not risk the stability of the other.

## Decision
We will adopt a strict **3-Layer Architecture**:

1.  **Layer 0: Foundation (Platform)**
    *   **Scope:** Networking (VNET/VPC), Hub-Spoke peering, Shared Identity (Entra ID/IAM), Governance (Policy/Org Policies).
    *   **Owner:** Platform Team.
    *   **Lifecycle:** Years. Changes are rare and high-risk.
    *   **Tech:** Terraform (stable providers).

2.  **Layer 1: Product Space (Vending Machine)**
    *   **Scope:** The logical container for a product team. Resource Groups, Accounts/Projects, Subnets delegating permissions, Managed Identities.
    *   **Owner:** Platform Team (vended to Product Team).
    *   **Lifecycle:** Months/Years. Setup once per product.
    *   **Tech:** Terraform Modules (Abstracted interface).

3.  **Layer 2: Workload (Application)**
    *   **Scope:** The actual application resources. App Services, Databases, Queues, Functions, Secrets.
    *   **Owner:** Product Team.
    *   **Lifecycle:** Days/Weeks. Frequent deployments.
    *   **Tech:** Bicep / Terraform / SAM / Serverless Framework (Team's choice within guardrails).

## Consequences

### Positive
*   ✅ **Risk Isolation:** A developer deploying an app cannot accidentally delete the VNET.
*   ✅ **Decoupled Velocity:** Product teams can deploy anytime without waiting for Platform team code reviews (Layer 2 is theirs).
*   ✅ **Security:** Permissions can be scoped strictly (e.g., Build Agent has `Contributor` on Resource Group, but `Reader` on VNET).

### Negative
*   ❌ **Dependency Management:** Layer 2 depends on outputs from Layer 1 (e.g., Subnet ID). This requires a clear contract (Inputs/Outputs).
*   ❌ **Complexity:** Requires multiple state files and pipelines instead of one "apply all".

## Compliance
This structure enforces the "Serviceability" pillar by preventing "Big Ball of Mud" architectures.
