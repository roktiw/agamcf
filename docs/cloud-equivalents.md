# 🗺️ Cloud Equivalents Map & Capability Catalog

This document serves as a "Rosetta Stone" for teams working in a multi-cloud environment. It maps Azure components to their equivalents in AWS and GCP, focusing on **capability parity** rather than just service naming.

> [!NOTE]
> **TPO Note:** "In this project, we focus on the Azure column, but the module architecture (inputs/outputs) is designed to easily plug in AWS/GCP backends under the same developer interface."

## 1. 🏛️ Core & Management

| Capability | Description | 🟦 Azure | 🟧 AWS | 🟩 GCP |
| :--- | :--- | :--- | :--- | :--- |
| **📦 Hierarchy Container** | Logical container for resources. AWS `Account` is a strong boundary. | **Resource Group** | **Account / Resource Group** | **Project** |
| **🆔 Identity Realm** | The directory containing users and groups. | **Entra ID Tenant** | **AWS Organization (IAM)** | **Cloud Identity / Org** |
| **💳 Subscription/Billing** | The unit of management and billing. | **Subscription** | **AWS Account** | **Billing Account** |
| **🏷️ Tagging** | Metadata key-value pairs for cost tracking. | **Tags** | **Tags** | **Labels** |
| **🤑 Cost Dashboard** | Visualization of spend and forecasting. | **Cost Management** | **Cost Explorer** | **Billing Reports** |
| **💡 Advisor** | Automated recommendations for best practices. | **Azure Advisor** | **Trusted Advisor** | **Active Assist / Recommender** |
| **🕹️ Cloud Shell** | Browser-based terminal with CLI tools. | **Cloud Shell** | **CloudShell** | **Cloud Shell** |
| **🗺️ Blueprints** | Vending machine patterns / templating. | **Template Specs / Blueprints** | **Service Catalog** | **Blueprints / Service Catalog** |

## 2. 💻 Compute

| Capability | Description | 🟦 Azure | 🟧 AWS | 🟩 GCP |
| :--- | :--- | :--- | :--- | :--- |
| **🖥️ Virtual Machines** | IaaS instances. Base unit of compute. | **Virtual Machines (VM)** | **EC2 Instances** | **Compute Engine (GCE)** |
| **⚖️ VM Autoscaling** | Automatic scaling of VM groups. | **VM Scale Sets (VMSS)** | **Auto Scaling Groups** | **Managed Instance Groups (MIG)** |
| **💾 Dedicated Host** | Physical server isolation for compliance. | **Azure Dedicated Host** | **EC2 Dedicated Hosts** | **Sole-tenant Nodes** |
| **🏢 VMware as Service** | Managed VMware stack in the cloud. | **Azure VMware Solution** | **VMware Cloud on AWS** | **Google Cloud VMware Engine** |
| **☸️ Managed K8s** | Managed Kubernetes control plane. | **AKS** (Azure Kubernetes Service) | **EKS** (Elastic Kubernetes Service) | **GKE** (Google Kubernetes Engine) |
| **📦 Container PaaS** | Serverless container execution. | **Azure Container Apps** | **Fargate / App Runner** | **Cloud Run** |
| **🌐 App PaaS** | Traditional PaaS (Java, .NET, Node). | **App Service** | **Elastic Beanstalk** | **App Engine** |
| **⚡ FaaS (Serverless)** | Event-driven function execution. | **Azure Functions** | **AWS Lambda** | **Cloud Functions** |
| **🔢 Batch Processing** | Large-scale parallel batch jobs. | **Azure Batch** | **AWS Batch** | **Cloud Batch** |
| **🌌 Hybrid K8s Control** | Management of clusters outside the cloud. | **Azure Arc** | **EKS Anywhere** | **Anthos (GKE Enterprise)** |

## 3. 💾 Storage

| Capability | Description | 🟦 Azure | 🟧 AWS | 🟩 GCP |
| :--- | :--- | :--- | :--- | :--- |
| **🪣 Object Storage** | Unstructured data (S3 compatible). | **Blob Storage** | **S3** | **Cloud Storage** (GCS) |
| **💿 Block Storage** | VM-attached drives. | **Managed Disks** | **EBS** (Elastic Block Store) | **Persistent Disk** |
| **📁 File Storage (SMB)** | Managed file shares (General Purpose). | **Azure Files** | **Amazon FSx for Windows** | **Filestore** (NFS) / **NetApp** |
| **📁 File Storage (NFS)** | High-performance NFS. | **Azure NetApp Files** | **EFS** (Elastic File System) | **Filestore** |
| **🧊 Archive Storage** | Long-term, low-cost retention tiers. | **Blob Archive Tier** | **S3 Glacier** | **Archive Storage** |
| **🚚 Physical Transfer** | Moving massive data volumes via device. | **Data Box** | **Snowball** | **Transfer Appliance** |
| **💾 Hybrid Storage** | Gateway to present cloud storage on-prem. | **Azure File Sync** | **Storage Gateway** | **Storage Transfer Service** |

## 4. 🖧 Networking

| Capability | Description | 🟦 Azure | 🟧 AWS | 🟩 GCP |
| :--- | :--- | :--- | :--- | :--- |
| **🌐 Virtual Network** | Private network isolation. | **VNet** | **VPC** | **VPC** (Global) |
| **🔗 Peering** | Connecting two virtual networks. | **VNet Peering** | **VPC Peering** | **VPC Network Peering** |
| **🚇 VPN Gateway** | Site-to-Site VPN connection. | **VPN Gateway** | **AWS Site-to-Site VPN** | **Cloud VPN** |
| **🚅 Private Circuit** | Dedicated private fiber connection. | **ExpressRoute** | **Direct Connect** | **Cloud Interconnect** |
| **🌍 Global Hub** | Global transit network manager. | **Virtual WAN** | **Transit Gateway** | **Network Connectivity Center** |
| **🚦 Load Balancer (L7)** | HTTP/HTTPS routing, WAF integration. | **Application Gateway** | **ALB** (Application Load Balancer) | **Cloud Load Balancing** (HTTP) |
| **⚖️ Load Balancer (L4)** | TCP/UDP traffic distribution. | **Azure Load Balancer** | **NLB** (Network Load Balancer) | **Network Load Balancing** |
| **🌏 Global Routing** | Global DNS-based or Anycast routing. | **Traffic Manager** / **Front Door** | **Global Accelerator** | **Cloud Load Balancing** (Anycast) |
| **🔗 Private Link** | Access PaaS services on private IP. | **Private Link** | **PrivateLink** | **Private Service Connect** |
| **🧭 DNS** | Managed Domain Name System. | **Azure DNS** | **Route 53** | **Cloud DNS** |
| **⚡ CDN** | Content Delivery Network. | **Azure Front Door / CDN** | **CloudFront** | **Cloud CDN** |

## 5. 🗄️ Databases

| Capability | Description | 🟦 Azure | 🟧 AWS | 🟩 GCP |
| :--- | :--- | :--- | :--- | :--- |
| **🐬 Relational (SQL)** | Managed SQL Server, Postgres, MySQL. | **Azure SQL / DB for PostgreSQL** | **RDS** / **Aurora** | **Cloud SQL** / **AlloyDB** |
| **📄 NoSQL (Doc)** | High-scale key-value or document stores. | **Cosmos DB** | **DynamoDB** | **Firestore** / **Bigtable** |
| **🚀 In-Memory Cache** | Managed Redis/Memcached. | **Azure Cache for Redis** | **ElastiCache** | **Memorystore** |
| **📉 Data Warehouse** | Petabyte-scale analytics warehouse. | **Synapse Analytics (SQL Pool)** | **Redshift** | **BigQuery** |
| **🕸️ Graph DB** | Relationship-based data model. | **Cosmos DB (Gremlin)** | **Neptune** | **Spanner (Graph)** / **JanusGraph** |
| **⏱️ Time Series** | Optimized for IoT/telemetry data. | **Azure Data Explorer (Kusto)** | **Timestream** | **Bigtable** / **TimescaleDB** |
| **🔄 DB Migration** | Tools to migrate databases. | **Database Migration Service** | **DMS** | **Database Migration Service** |

## 6. 📊 Analytics & Big Data

| Capability | Description | 🟦 Azure | 🟧 AWS | 🟩 GCP |
| :--- | :--- | :--- | :--- | :--- |
| **🐘 Hadoop/Spark** | Managed Big Data clusters. | **HDInsight / Databricks** | **EMR (Elastic MapReduce)** | **Dataproc** |
| **🧹 ETL / Integration** | Visual data orchestration and transformation. | **Data Factory** | **Glue** | **Cloud Data Fusion** / **Dataflow** |
| **🌊 Stream Analytics** | Real-time data processing. | **Stream Analytics** | **Kinesis Data Analytics** | **Dataflow** |
| **🔍 Interactive Query** | Serverless SQL on Object Storage. | **Synapse Serverless / Fabric** | **Athena** | **BigQuery Omni** |
| **📚 Data Catalog** | Data governance and discovery. | **Purview** | **DataZone / Glue Data Catalog** | **Dataplex / Data Catalog** |
| **📈 BI Visualization** | Business Intelligence dashboards. | **Power BI** | **QuickSight** | **Looker** |

## 7. 🔌 Integration & Messaging

| Capability | Description | 🟦 Azure | 🟧 AWS | 🟩 GCP |
| :--- | :--- | :--- | :--- | :--- |
| **📨 Message Queue** | Standard buffer queue. | **Storage Queues / Service Bus** | **SQS** (Simple Queue Service) | **Cloud Tasks / Pub/Sub** |
| **📢 Pub/Sub** | High-throughput event ingestion. | **Event Hubs** | **Kinesis Data Streams** | **Pub/Sub** |
| **🔔 Event Bus** | Discrete event routing (reactive). | **Event Grid** | **EventBridge** | **Eventarc** |
| **🚪 API Gateway** | API management and throttling. | **API Management** | **API Gateway** | **Apigee / API Gateway** |
| **🎼 Workflow** | Orchestration of stateful steps. | **Logic Apps** | **Step Functions** | **Workflows / Composer** |

## 8. 🛠️ DevOps & Developer Tools

| Capability | Description | 🟦 Azure | 🟧 AWS | 🟩 GCP |
| :--- | :--- | :--- | :--- | :--- |
| **🏗️ IaC** | Infrastructure as Code (Native). | **Bicep / ARM** | **CloudFormation** | **Deployment Manager** |
| **📟 Source Repos** | Private Git repositories. | **Azure Repos** | **CodeCommit** | **Source Repositories** |
| **🚀 CI/CD Pipelines** | Build and release automation. | **Azure Pipelines** (or GitHub Actions) | **CodeBuild / CodePipeline** | **Cloud Build / Cloud Deploy** |
| **📦 Artifact Repo** | Package management (npm, docker). | **Azure Artifacts** | **CodeArtifact / ECR** | **Artifact Registry** |
| **🧪 Test Farm** | Real device testing for mobile. | **Visual Studio App Center** | **Device Farm** | **Firebase Test Lab** |
| **💥 Chaos Eng** | Fault injection testing. | **Chaos Studio** | **Fault Injection Simulator** | *(Third-party)* |

## 9. 🔐 Identity & Security

| Capability | Description | 🟦 Azure | 🟧 AWS | 🟩 GCP |
| :--- | :--- | :--- | :--- | :--- |
| **🆔 Resource Identity** | Workload identity (no keys). | **Managed Identity** | **IAM Role** | **Service Account** |
| **👥 Consumer Identity** | Auth for customers (signup/signin). | **Entra External ID (B2C)** | **Cognito** | **Identity Platform** |
| **🔑 Secrets Mgmt** | Storage for API keys/certs. | **Key Vault** | **Secrets Manager** | **Secret Manager** |
| **🔐 Keys (KMS)** | Encryption key management. | **Key Vault** | **KMS** | **Cloud KMS** |
| **🏧 HSM** | Dedicated hardware security modules. | **Dedicated HSM** | **Cloud HSM** | **Cloud HSM** |
| **🛡️ WAF** | Web Application Firewall. | **Web App Firewall** | **AWS WAF** | **Cloud Armor** |
| **🧱 Network Firewall** | Managed Next-Gen Firewall. | **Azure Firewall** | **Network Firewall** | **Cloud Firewall** |
| **💣 DDoS Protection** | Advanced attack mitigation. | **DDoS Protection Standard** | **Shield Advanced** | **Cloud Armor** |
| **🕵️ CSPM/Threats** | Security posture & threat detection. | **Defender for Cloud** | **Security Hub / GuardDuty** | **Security Command Center** |

## 10. 🧠 AI & ML

| Capability | Description | 🟦 Azure | 🟧 AWS | 🟩 GCP |
| :--- | :--- | :--- | :--- | :--- |
| **🤖 LLM API**| Access to foundation models. | **Azure OpenAI Service** | **Bedrock** | **Vertex AI (Model Garden)** |
| **🧪 ML Platform** | End-to-end ML lifecycle. | **Azure Machine Learning** | **SageMaker** | **Vertex AI** |
| **👁️ Vision** | Image analysis/OCR. | **Azure AI Vision** | **Rekognition** | **Why Vision AI** |
| **🗣️ Speech** | Speech-to-Text / Text-to-Speech. | **Azure AI Speech** | **Transcribe / Polly** | **Speech-to-Text / TTS** |
| **💬 Language** | Translation and NLP. | **Azure AI Language** | **Translate / Comprehend** | **Translation AI / NL API** |
| **🤖 Conversational** | Chatbot framework. | **Bot Service** | **Lex** | **Dialogflow** |

## 11. 📱 Mobile & Web (Client)

| Capability | Description | 🟦 Azure | 🟧 AWS | 🟩 GCP |
| :--- | :--- | :--- | :--- | :--- |
| **📱 Mobile Backend** | Backend-as-a-Service (Data/Auth). | *(Legacy) App Center* | **Amplify** | **Firebase** |
| **🔔 Push Notif** | Cross-platform push notifications. | **Notification Hubs** | **Pinpoint / SNS** | **Firebase Cloud Messaging** |
| **📍 Maps** | Geospatial data and routing. | **Azure Maps** | **Location Service** | **Google Maps Platform** |

## 12. 🔌 Hybrid, Edge & Migration

| Capability | Description | 🟦 Azure | 🟧 AWS | 🟩 GCP |
| :--- | :--- | :--- | :--- | :--- |
| **🏢 On-Prem Stack** | Cloud hardware in your DC. | **Azure Stack Hub/HCI** | **Outposts** | **Distributed Cloud** |
| **📦 Edge Device** | Ruggedized compute for edge. | **Data Box Edge** | **Snowball Edge** | **Edge TPU** |
| **🔄 Server Migration** | Lift-and-shift tooling. | **Azure Migrate** | **Application Migration Service** | **Migrate to Virtual Machines** |
| **🛰️ Sovereign Cloud** | Isolated Government regions. | **Azure Government** | **AWS GovCloud** | **Assured Workloads** |
