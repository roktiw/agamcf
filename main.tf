module "product_space" {
  source = "./modules/product-space-azure"

  project_code = "aga-lab"
  environment  = "dev"
  size         = "small"
  location     = "Poland Central"

  tags = {
    Owner       = "TPO-Candidate"
    Project     = "AGA"
    CostCenter  = "12345"
    ManagedBy   = "Terraform"
  }
}
