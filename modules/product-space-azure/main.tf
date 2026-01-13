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

# 3. Magazyn Danych (Storage Component)
resource "azurerm_storage_account" "storage" {
  name                     = "st${replace(var.product_code, "-", "")}${var.environment}"
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
