variable "project_code" {
  description = "Unikalny kod projektu (np. 'aga-lab')"
  type        = string
}

variable "environment" {
  description = "Środowisko: dev, test, prod"
  type        = string
  validation {
    condition     = contains(["dev", "test", "prod"], var.environment)
    error_message = "Dozwolone środowiska to tylko: dev, test, prod."
  }
}

variable "size" {
  description = "Rozmiar Product Space (determinuje moc obliczeniową i koszty)"
  type        = string
  default     = "small"
  validation {
    condition     = contains(["small", "medium", "large"], var.size)
    error_message = "Dostępne rozmiary to: small, medium, large."
  }
}

variable "location" {
  description = "Region Azure"
  type        = string
  default     = "Poland Central"
}

variable "tags" {
  description = "Tagi przypisane do zasobów"
  type        = map(string)
  default     = {}
}
