# ---------------------------------------------------------------------------------------------------------------------
# 🤝 PLATFORM CONTRACT: INPUTS
# These variables MUST be present in every Product Space module (Azure, AWS, GCP).
# ---------------------------------------------------------------------------------------------------------------------

variable "product_code" {
  description = "Short identifier for the product (max 10 chars). Used in naming resources."
  type        = string
  validation {
    condition     = length(var.product_code) <= 12 && can(regex("^[a-z0-9-]+$", var.product_code))
    error_message = "product_code must be max 12 chars, lowercase alphanumeric + hyphens."
  }
}

variable "environment" {
  description = "Deployment environment (Lifecycle Stage)."
  type        = string
  validation {
    condition     = contains(["dev", "test", "prod"], var.environment)
    error_message = "environment must be one of: dev, test, prod."
  }
}

variable "size" {
  description = "T-Shirt size determining compute/storage capacity."
  type        = string
  default     = "small"
  validation {
    condition     = contains(["small", "medium", "large"], var.size)
    error_message = "size must be one of: small, medium, large."
  }
}

variable "location" {
  description = "Cloud provider region."
  type        = string
}

variable "network_mode" {
  description = "Networking isolation level. 'private' implies Private Endpoints/Link."
  type        = string
  default     = "private"
  validation {
    condition     = contains(["private", "public"], var.network_mode)
    error_message = "network_mode must be one of: private, public."
  }
}

variable "access_mode" {
  description = "Application visibility scope."
  type        = string
  default     = "corporate-only"
  validation {
    condition     = contains(["corporate-only", "public"], var.access_mode)
    error_message = "access_mode must be one of: corporate-only, public."
  }
}

variable "features" {
  description = "Optional features to enable."
  type = object({
    observability = optional(bool, true)
    budgets       = optional(bool, false)
    backup        = optional(bool, false)
  })
  default = {}
}

variable "tags" {
  description = "Governance tags required for all resources."
  type        = map(string)
  # Verification of specific keys (Owner, CostCenter) is usually done via Policy or sentinel, 
  # but basic structure is enforced here.
}
