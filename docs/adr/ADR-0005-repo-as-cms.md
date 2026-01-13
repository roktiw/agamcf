# ADR-0005: Repo as CMS - Platform Documentation & API Framework

## Status
Proposed

## Context
We are building a comprehensive platform that requires a scalable, transparent, and developer-friendly way to manage:
1.  **Public Platform Documentation**: Guides, architecture, and principles.
2.  **Future APIs**: Specifications and contract definitions for upcoming services.
3.  **API as a Service**: A unified interface where documentation and specifications drive the actual service discovery or gateway configurations.

Current static documentation approaches often become stale. We need a framework where the repository *is* the Content Management System (CMS), ensuring that the code, infrastructure, and their descriptions evolve in lock-step.

## Decision
We will adopt a "Repo as CMS" architecture. This is not just for a static blog, but a core component of our **Platform Framework**.

1.  **Source of Truth**: The `docs/` directory is the single source of truth for the Platform.
2.  **1:1 Mapping**: The directory structure within `docs/` directly maps to the user-facing URL structure.
3.  **Unified Content Lifecycle**:
    *   **Platform Docs**: `docs/platform/` contains high-level architecture and guides.
    *   **APIs**: `docs/api/` contains OpenAPI specifications (Swagger), schema definitions, and reference docs. These files may trigger CI pipelines to update API Gateways or generate SDKs (enabling "API as a Service").
4.  **Automated Rendering**: GitHub Actions will transform Markdown and OpenAPI specs into a polished HTML experience deployed to `public/` (and the live site).

## Proposed Structure

This structure ensures that our public face matches our internal engineering organization.

```text
/
├── docs/                       # -> https://platform.domain.com/
│   ├── index.md                # Home / Landing
│   ├── platform/               # -> /platform
│   │   ├── system-architecture.md
│   │   └── security.md
│   ├── api/                    # -> /api (API Registry & Docs)
│   │   ├── index.md            # API Catalog
│   │   ├── v1/
│   │   │   ├── users.yaml      # OpenAPI Spec for Users API
│   │   │   └── billing.md      # Billing API Guide
│   │   └── future/             # -> /api/future (Drafts/RFCs)
│   │       └── ai-service.md   # Proposed AI Service spec
│   └── adr/                    # -> /adr (Decision Log)
│       └── index.md
├── .github/
│   └── workflows/
│       └── publish-docs.yml    # Builds site & validates API specs
└── public/                     # Generated Static Site
```

## "API as a Service" Integration
By treating API specs (YAML/JSON) as first-class citizens in `docs/`:
*   **Validation**: CI checks ensure specs are valid.
*   **Mocking**: We can automatically spin up mock servers based on these specs.
*   **Discovery**: The public site becomes a dynamic catalog of available services.

## Consequences
### Positive
*   **Integrated Workflow**: Engineers document APIs in the same PR where they implement them.
*   **Transparency**: Future APIs are visible as drafts in `docs/api/future`, allowing early feedback.
*   **Consistency**: The "Public Face" of the platform is always in sync with the codebase.

### Negative
*   **Strictness**: Requires adhering to file naming conventions to ensure clean URLs.
*   **Tooling**: Need to select tools that handle both Markdown (prose) and OpenAPI (specs) gracefully (e.g., Redoc, SwaggerUI embedded in the SSG).
