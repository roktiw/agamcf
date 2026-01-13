# 🗺️ Cloud Equivalents Map & Capability Catalog

This document serves as a "Rosetta Stone" for teams working in a multi-cloud environment. It maps Azure components to their equivalents in AWS and GCP, focusing on **capability parity** rather than just service naming.

> [!NOTE]
> **TPO Note:** "In this project, we focus on the Azure column, but the module architecture (inputs/outputs) is designed to easily plug in AWS/GCP backends under the same developer interface."

## 1. 🏛️ Core Platform Structure

| Capability | 🟦 Azure | 🟧 AWS | 🟩 GCP | Description |
| :--- | :--- | :--- | :--- | :--- |
| **Hierarchy Container** | **Resource Group** | **Account / Resource Group** | **Project** | Logical container for resources. In AWS, the `Account` is the strong boundary, while `Resource Groups` are tag-based. GCP `Project` is the billing/IAM boundary. |
| **Identity Realm** | **Entra ID Tenant** | **AWS Organization (IAM)** | **Cloud Identity / Org** | The directory containing users and groups. |
| **Subscription/Billing** | **Subscription** | **AWS Account** | **Billing Account** | The unit of management and billing. |

## 2. 💻 Compute

| Capability | 🟦 Azure | 🟧 AWS | 🟩 GCP | Description |
| :--- | :--- | :--- | :--- | :--- |
| **Virtual Machines** | **Virtual Machines (VM)** | **EC2 Instances** | **Compute Engine (GCE)** | IaaS instances. Base unit of compute. |
| **Managed K8s** | **AKS** (Azure Kubernetes Service) | **EKS** (Elastic Kubernetes Service) | **GKE** (Google Kubernetes Engine) | Managed Kubernetes control plane and node pools. |
| **Container PaaS** | **Azure Container Apps** | **Fargate / App Runner** | **Cloud Run** | Serverless container execution. No cluster management required. |
| **App PaaS** | **App Service** | **Elastic Beanstalk** | **App Engine** | Traditional PaaS for code deployment (Java, .NET, Node, etc.). |
| **FaaS (Serverless)** | **Azure Functions** | **AWS Lambda** | **Cloud Functions** | Event-driven function execution. |

## 3. 💾 Storage

| Capability | 🟦 Azure | 🟧 AWS | 🟩 GCP | Description |
| :--- | :--- | :--- | :--- | :--- |
| **Object Storage** | **Blob Storage** | **S3** (Simple Storage Service) | **Cloud Storage** (GCS) | Unstructured data storage (images, backups, docs). Critical for "Docs-as-Code" hosting. |
| **Block Storage** | **Managed Disks** | **EBS** (Elastic Block Store) | **Persistent Disk** | VM-attached drives. |
| **File Storage** | **Azure Files** | **EFS** / **FSx** | **Filestore** | NFS/SMB key-value file shares. |
| **Archive Storage** | **Blob Archive Tier** | **S3 Glacier** | **Archive Storage** | Long-term, low-cost retention. |

## 4. 🖧 Networking

| Capability | 🟦 Azure | 🟧 AWS | 🟩 GCP | Description |
| :--- | :--- | :--- | :--- | :--- |
| **Virtual Network** | **VNet** | **VPC** | **VPC** | Private network isolation. NB: GCP VPC is global; Azure/AWS are regional. |
| **Load Balancer (L7)** | **Application Gateway** / **Front Door** | **ALB** (Application Load Balancer) | **Cloud Load Balancing** | HTTP/HTTPS routing, WAF integration. |
| **Load Balancer (L4)** | **Azure Load Balancer** | **NLB** (Network Load Balancer) | **Network Load Balancing** | TCP/UDP traffic distribution. |
| **DNS** | **Azure DNS** | **Route 53** | **Cloud DNS** | Managed Domain Name System. |
| **CDN** | **Azure Front Door** | **CloudFront** | **Cloud CDN** | Content Delivery Network for edge caching. |

## 5. 🗄️ Databases

| Capability | 🟦 Azure | 🟧 AWS | 🟩 GCP | Description |
| :--- | :--- | :--- | :--- | :--- |
| **Relational (SQL)** | **Azure SQL / Database for PostgreSQL** | **RDS** / **Aurora** | **Cloud SQL** / **AlloyDB** | Managed SQL instances. |
| **NoSQL (Doc)** | **Cosmos DB** | **DynamoDB** | **Firestore** / **Bigtable** | High-scale key-value or document stores. |
| **In-Memory Cache** | **Azure Cache for Redis** | **ElastiCache** | **Memorystore** | Managed Redis/Memcached. |

## 6. 🔐 Identity & Security

| Capability | 🟦 Azure | 🟧 AWS | 🟩 GCP | Description |
| :--- | :--- | :--- | :--- | :--- |
| **Resource Identity** | **Managed Identity** | **IAM Role** | **Service Account** | Identity utilized by the workload itself (no hardcoded keys). |
| **Secrets Mgmt** | **Key Vault** | **Secrets Manager** | **Secret Manager** | Storage for API keys, passwords, certificates. |
| **Keys (KMS)** | **Key Vault** | **KMS** | **Cloud KMS** | Encryption key management. |
| **WAF** | **Web App Firewall** | **AWS WAF** | **Cloud Armor** | Protection against DDOS and OWASP Top 10. |

## 7. 🛠️ Management & Ops

| Capability | 🟦 Azure | 🟧 AWS | 🟩 GCP | Description |
| :--- | :--- | :--- | :--- | :--- |
| **IaC** | **Bicep / ARM** (Native) | **CloudFormation** (Native) | **Deployment Manager** | *Note: We use **Terraform** to abstract this layer.* |
| **Monitoring** | **Azure Monitor** | **CloudWatch** | **Cloud Monitoring** | Metrics, dashboards, and alerts. |
| **Logs** | **Log Analytics** | **CloudWatch Logs** | **Cloud Logging** | Centralized log aggression and queries. |
| **Policy** | **Azure Policy** | **AWS Config** / **SCP** | **Org Policy** | Guardrails and compliance enforcement. |

## 8. 🧠 AI & ML (Future Scope)

| Capability | 🟦 Azure | 🟧 AWS | 🟩 GCP | Description |
| :--- | :--- | :--- | :--- | :--- |
| **LLM Model Garden**| **Azure OpenAI Service** | **Bedrock** | **Vertex AI (Model Garden)** | Access to foundation models via API. |
| **ML Platform** | **Azure Machine Learning** | **SageMaker** | **Vertex AI** | End-to-end ML lifecycle management. |
