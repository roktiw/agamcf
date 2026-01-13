# 1. Kontener na wszystko (Health: Isolation)
resource "azurerm_resource_group" "rg" {
  name     = "rg-${var.product_code}-${var.environment}"
  location = var.location
  tags     = var.tags
}

# 2. Tożsamość (Health: Security)
resource "azurerm_user_assigned_identity" "identity" {
  name                = "id-${var.product_code}"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
}


resource "random_string" "suffix" {
  length  = 6
  special = false
  upper   = false
}

# 3. Magazyn Danych (Storage Component)
# Global uniqueness required
resource "azurerm_storage_account" "storage" {
  name                     = "st${replace(var.product_code, "-", "")}${var.environment}${random_string.suffix.result}"
  resource_group_name      = azurerm_resource_group.rg.name
  location                 = azurerm_resource_group.rg.location
  account_tier             = "Standard"
  account_replication_type = var.environment == "prod" ? "GRS" : "LRS"
  tags                     = var.tags
}

# 4. Moc Obliczeniowa (Compute Component)
resource "azurerm_service_plan" "plan" {
  name                = "asp-${var.product_code}"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  os_type             = "Linux"
  
  sku_name = lookup({
    "small"  = "B1"
    "medium" = "P1v3"
    "large"  = "P3v3"
  }, var.size, "B1")

  tags = var.tags
}

# 5. Obserwowalność (Observability Component)
# Only created if features.observability is true
resource "azurerm_log_analytics_workspace" "main" {
  count               = var.features.observability ? 1 : 0
  name                = "log-${var.product_code}-${var.environment}"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  sku                 = "PerGB2018"
  retention_in_days   = var.environment == "prod" ? 90 : 30
  tags                = var.tags
}

resource "azurerm_application_insights" "main" {
  count               = var.features.observability ? 1 : 0
  name                = "appi-${var.product_code}-${var.environment}"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  workspace_id        = azurerm_log_analytics_workspace.main[0].id
  application_type    = "web"
  tags                = var.tags
}
