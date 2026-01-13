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

