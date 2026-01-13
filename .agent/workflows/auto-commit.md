---
description: Auto-commit and push changes
---

# Auto-Commit and Push Workflow

This workflow ensures that every change to the codebase is immediately committed and pushed to the remote repository.

## Steps

1.  **Add all changes:**
    ```bash
    git add .
    ```

2.  **Commit changes:**
    Use a descriptive message or a default timestamped message if none is provided.
    ```bash
    git commit -m "chore: auto-commit by agent"
    ```

3.  **Push changes:**
    ```bash
    git push origin main
    ```

> [!NOTE]
> Ensure the git remote is configured before running this workflow.
