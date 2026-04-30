# Azure DevOps Multi-Environment Terraform VM Pipeline

## Overview

This project provisions Azure infrastructure using Terraform and deploys it through an Azure DevOps multi-stage pipeline across multiple environments.

Supported environments:

* Development (Dev)
* User Acceptance Testing (UAT)
* Production (Prod)

---

## Project Structure

```text
PIPELINE/
│
├── infra/
│   ├── main.tf
│   ├── provider.tf
│   ├── variables.tf
│   ├── dev.tfvars
│   ├── uat.tfvars
│   ├── prod.tfvars
│   └── .terraform.lock.hcl
│
├── modules/
│   └── vm/
│       ├── main.tf
│       ├── variables.tf
│       └── outputs.tf
│
├── templates/
│   ├── terraform-plan.yml
│   ├── terraform-apply.yml
│   └── deploy.yml
│
├── azure-pipelines.yml
└── README.md
```

---

## Features

* Infrastructure as Code using Terraform
* Multi-stage Azure DevOps Pipeline
* Separate Dev / UAT / Prod deployments
* Reusable Terraform Modules
* Environment-specific tfvars files
* Approval gates support for Production
* Variable Group / Key Vault ready

---

## Pipeline Stages

### 1. Build / Validation

* Terraform Init
* Terraform Validate
* Terraform Plan

### 2. Deploy Dev

* Apply Terraform using `dev.tfvars`

### 3. Deploy UAT

* Apply Terraform using `uat.tfvars`

### 4. Deploy Prod

* Apply Terraform using `prod.tfvars`

---

## Prerequisites

Before using this project, ensure you have:

* Azure Subscription
* Azure DevOps Project
* Service Connection configured
* Terraform installed
* Azure CLI installed

---

## How to Run Locally

### Dev Deployment

```bash
cd infra
terraform init
terraform plan -var-file="dev.tfvars"
terraform apply -var-file="dev.tfvars"
```

### UAT Deployment

```bash
terraform apply -var-file="uat.tfvars"
```

### Prod Deployment

```bash
terraform apply -var-file="prod.tfvars"
```

---

## Azure DevOps Setup

### Required Variable Group Values

| Variable               | Description                   |
| ---------------------- | ----------------------------- |
| azureServiceConnection | Azure Service Connection Name |
| subscriptionId         | Azure Subscription ID         |
| tenantId               | Azure Tenant ID               |

---

## Best Practices Implemented

* Modular Terraform Design
* Environment Segregation
* CI/CD Automation
* Secure Secret Management Ready
* Approval Gates for Production

---

## Future Enhancements

* Add Remote Backend for Terraform State
* Integrate Azure Key Vault
* Add Health Checks After Deployment
* Add Rollback Strategy

---

## Author

Deepanshu Vashisth

---
