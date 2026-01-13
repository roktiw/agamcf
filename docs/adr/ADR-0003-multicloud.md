# ADR-0003: Multi-Cloud Capability Parity

*   **Status:** Accepted
*   **Date:** 2026-01-13
*   **Context:**
    We support Azure, AWS, and GCP. Trying to create a "Lowest Common Denominator" abstraction (e.g., a generic "Virtual Machine" resource that looks identical everywhere) hides important platform specificities and effectively cripples the unique strengths of each cloud.

## Decision
We adopt a **Capability Parity** strategy, not **Service Parity**.

*   **Capability:** "Secure Static Web Hosting".
*   **Service (Implementation):**
    *   *Azure Implementation:* Storage Account + Static Website + Front Door.
    *   *AWS Implementation:* S3 + CloudFront.
    *   *GCP Implementation:* GCS + Load Balancer.

### The Rules
1.  **Contract First:** The User Interface (Module Inputs) asks for the *intent* (e.g., `access_mode: public`, `workload_type: static-site`), not the *implementation* (e.g., `enable_s3_public_access`).
2.  **Native Power:** Inside the module, we use the cloud-native "Best Practice" service, even if it has different parameters than the other clouds.
3.  **Document Differences:** We explicitly document limitations or "footguns" (e.g., "Azure Front Door propagation takes 20 mins, AWS CloudFront takes 5 mins") instead of adding hacky waits to artificially sync them.

## Consequences

### Positive
*   ✅ **Quality:** We use the best tool for the job in each cloud (e.g., Azure Private Endpoints vs AWS PrivateLink).
*   ✅ **Maintainability:** Wrappers are thin; they don't try to reimplement cloud logic.
*   ✅ **User Experience:** Users get a consistent outcome ("My site is online") without needing to be an expert in every provider's resource naming.

### Negative
*   ❌ **Drafting Effort:** The "Contract" requires careful design to be abstract enough to fit all clusters but specific enough to be useful.
*   ❌ **Leaky Abstractions:** Sometimes a cloud-specific quirk (like global uniqueness of Storage Names in Azure) leaks into the common interface validation.

## Compliance
This powers the "Operational Excellence" pillar by reducing cognitive load for developers using the platform.
