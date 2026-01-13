# 🛡️ Azure Secure PaaS Stamp: Enterprise Web Hosting

**Product Vision:** Deliver a secure, compliant, and fully managed platform for web applications to developers, removing the need for product teams to configure networking. *"Security by default, not as an option."*

## 🏗️ Architecture & Components

This project utilizes a **Hybrid IaC** approach to maximize material quality and serviceability:

### 🧱 Foundation (Terraform)
Handles the "hard" infrastructure with a long lifecycle. The system skeleton.
*   **Network (VNET & Subnets):** Isolated subnets with Network Security Groups (NSG).
*   **Connectivity (Private Endpoints):** Guarantees traffic never leaves the Microsoft network.
*   **DNS:** Private DNS zones for secure name resolution.

### 🎨 Finish & Logic (Bicep)
Handles the application layer ("soft"), close to developers and Azure Resource Manager.
*   **Compute (App Service):** Scalable compute unit.
*   **Security (Key Vault):** Secret management without hardcoding in code.
*   **Observability (App Insights):** Built-in application health sensors.

## 🌟 Key Features

| Icon | Feature | System Health Impact | Value Rating |
| :--- | :--- | :--- | :--- |
| 🛡️ | **Zero Public Access** | App completely cut off from the public internet. | ⭐⭐⭐⭐⭐ |
| 🏥 | **Self-Healing Infra** | Automatic configuration drift detection. | ⭐⭐⭐⭐ |
| 💰 | **Cost Guardrails** | Built-in tagging and budget alerts. | ⭐⭐⭐⭐ |
| 🔐 | **Identity-First** | Managed Identity for passwordless communication. | ⭐⭐⭐⭐⭐ |
| 🧩 | **Modular Design** | Interchangeable modules (e.g., swapping databases). | ⭐⭐⭐ |

## 🩺 Serviceability & Quality

As a Technical Product Owner, my priority is long-term serviceability:
1.  **Hybrid Approach (TF + Bicep):** Allows using the best tool for the job, reducing "technical debt".
2.  **Material Quality:** We use only LTS module versions and Availability Zone-supporting resources.
3.  **Documentation:** Automatically generated from code, plus manual ADRs (Architecture Decision Records).

## 🗺️ Product Roadmap & Backlog

- [x] **MVP:** VNET + App Service + Private Endpoint (In Progress)
- [ ] **Phase 2 (Observability):** Real-time Azure Monitor dashboards.
- [ ] **Phase 3 (Compliance):** Azure Policy enforcing data residency (Poland Central).
- [ ] **Phase 4 (Automation):** GitHub Actions with security tests.

## 🚀 Getting Started

### Prerequisites
*   Azure CLI
*   Terraform >= 1.5.0
*   Bicep CLI

### Instructions
1. Clone the repository.
2. Initialize Terraform:
   ```bash
   terraform init
   terraform apply
   ```

## 📞 Contact
**[Your Name]** - Technical Product Owner Candidate
*Passionate about building healthy, serviceable cloud platforms.*
