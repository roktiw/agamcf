# ---------------------------------------------------------------------------------------------------------------------
# 🤝 PLATFORM CONTRACT: OUTPUTS
# These outputs MUST be present in every Product Space module.
# ---------------------------------------------------------------------------------------------------------------------

output "resource_container_id" {
  description = "The ID of the container holding resources (Resource Group ID)."
  value       = azurerm_resource_group.rg.id
}

output "workspace_id" {
  description = "ID of the centralized Log Analytics Workspace (if observability enabled)."
  value       = try(azurerm_log_analytics_workspace.main[0].id, null)
}

output "primary_endpoint" {
  description = "The main URL for the deployed workload (not applicable for empty space, but ready for app)."
  value       = null # Will be populated when we add App Service code deployment
}

output "network_id" {
  description = "ID of the VNET where resources are deployed."
  value       = null # Placeholder until Networking is implemented
}

output "identity_principal_id" {
  description = "The Principal ID of the Managed Identity."
  value       = azurerm_user_assigned_identity.identity.principal_id
}

output "identity_client_id" {
  description = "The Client ID of the Managed Identity (useful for OIDC)."
  value       = azurerm_user_assigned_identity.identity.client_id
}

output "deployment_metadata" {
  description = "Metadata about the deployment."
  value = {
    cloud_provider = "azure"
    environment    = var.environment
    product_code   = var.product_code
  }
}
