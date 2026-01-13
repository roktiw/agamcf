# ADR-0002: State Management & Bootstrap Strategy

*   **Status:** Accepted
*   **Date:** 2026-01-13
*   **Context:**
    In a multi-cloud, multi-team environment, local state files are a security risk and a collaboration blocker. We need a unified strategy for storing Infrastructure-as-Code state that supports locking and prevents "chicken-and-egg" deployment issues.

## Decision

### 1. Remote State
All state must be stored remotely with encryption at rest and in transit.
*   **Azure:** Azure Storage Account (Blob) + ARM Lease for locking.
*   **AWS:** S3 Bucket + DynamoDB for locking.
*   **GCP:** GCS Bucket (supports native locking).

### 2. Separation of Bootstrap
The infrastructure required *to store the state* (the "Bootstrap" layer) must be created separately from the infrastructure *managed by the state*.
*   **Pattern:** A dedicated `bootstrap/` directory or script creates the storage buckets/accounts first.
*   **Rule:** The CI/CD pipeline assumes the backend storage already exists. It does *not* attempt to create it.

### 3. State Isolation
*   **Per Environment:** Prod state is physically separated from Dev state (different buckets/accounts).
*   **Per Layer:** Layer 0 (Foundation) and Layer 1 (Product Space) have separate state files to enforce the Layering Strategy (ADR-0001).

## Consequences

### Positive
*   ✅ **Collaboration:** Multiple agents/engineers can work safely using state locking.
*   ✅ **Security:** State files (which may contain sensitive outputs) are stored in restricted buckets, not on developer laptops.
*   ✅ **Stability:** "Bootstrap separation" prevents accidental deletion of the state file itself during a `terraform destroy`.

### Negative
*   ❌ **Setup Overhead:** Requires an initial manual or scripted step to set up the distinct bootstrap environment for each cloud.
*   ❌ **Cost:** Minimal costs for storage and locking services.

## Compliance
This aligns with the "Security" and "Administration" pillars.
