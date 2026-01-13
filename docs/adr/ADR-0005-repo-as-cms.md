# ADR-0005: Repo as CMS & 1:1 Docs Mapping

## Status
Proposed

## Context
We need a simple, version-controlled way to manage documentation and website content. The goal is to ensure that the file structure in the repository directly corresponds to the URL structure of the deployed website. This "What You See Is What You Get" (in terms of structure) approach simplifies mental models for contributors and ensures consistent routing.

Currently, we have a `docs/` directory, but we need a formalized agreement that this directory will serve as the single source of truth for the website's content, managed via Git, and built automatically.

## Decision
We will adopt a "Repo as CMS" architecture.

1.  **Source of Truth**: The `docs/` directory in the repository will contain all content for the website in Markdown format.
2.  **1:1 Mapping**: The directory structure within `docs/` will map 1:1 to the generated HTML structure in the `public/` directory (and thus the URL structure).
    *   `docs/index.md` -> `public/index.html` (Home)
    *   `docs/about.md` -> `public/about/index.html` (or `about.html`)
    *   `docs/features/cool-feature.md` -> `public/features/cool-feature/index.html`
3.  **Build Process**: We will use GitHub Actions as the build engine.
    *   An Action will watch for changes in `docs/`.
    *   It will convert Markdown files to HTML.
    *   It will output the result to a `public/` directory (or specific deployment branch/artifact).
4.  **Content Management**: The repository itself is the CMS. Content updates are made via Pull Requests or direct commits to Markdown files.

## Proposed Structure

```text
/
├── docs/                   # Content Source
│   ├── index.md            # -> domain.com/
│   ├── about.md            # -> domain.com/about
│   ├── architecture/       # -> domain.com/architecture/
│   │   ├── index.md        # -> domain.com/architecture/
│   │   ├── system.md       # -> domain.com/architecture/system
│   │   └── ...
│   └── adr/                # -> domain.com/adr/
│       ├── index.md        # -> List of ADRs
│       └── ...
├── .github/
│   └── workflows/
│       └── build-site.yml  # The "CMS" logic
└── public/                 # Generated Static Site (GitIgnored or gh-pages branch)
```

## Consequences
### Positive
*   **Simplicity**: navigation parallels file system navigation.
*   **Version Control**: All content is versioned with code.
*   **Automation**: No manual deployment steps; CI handles it.
*   **Portability**: Markdown is portable and easy to migrate if needed.

### Negative
*   **Flexibility**: Strict 1:1 mapping might make complex dynamic routes harder without additional build logic.
*   **Media Management**: Images and assets need a consistent location (e.g., `docs/assets` -> `public/assets`) to ensure relative links work both in repo preview and on the site.

## Implementation Steps
1.  Define the exact folder structure in `docs/` to match the desired site map.
2.  Select a static site generator (SSG) or write a custom script (e.g., Pandoc, simple SSG like Hugo/Jekyll/MkDocs configured for strict mapping) to perform the conversion.
3.  Configure GitHub Actions to run the build and deploy to GitHub Pages (or other host).
