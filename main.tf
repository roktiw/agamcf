module "product_space" {
  source = "./modules/product-space-azure"

  product_code = "aga-lab"
  environment  = "dev"
  size         = "small"
  location     = "Poland Central"
  
  # New Contract Capabilities
  network_mode = "private"
  access_mode  = "corporate-only"

  tags = {
    Owner       = "TPO-Candidate"
    Project     = "AGA"
    CostCenter  = "12345"
    ManagedBy   = "Terraform"
  }
}


output "product_space_details" {
  description = "Access details for the created Product Space."
  value = {
    resource_group = module.product_space.resource_container_id
    logs           = module.product_space.workspace_id
    identity       = module.product_space.identity_principal_id
    meta           = module.product_space.deployment_metadata
  }
}
