#Required Variables
variable "name" {
  description = "Name of the resource"
}

variable "application" {
  description = "Application of the resource"
}

variable "env_name" {
  description = "Deployment environment of the resource"
}

variable "machine_role" {
  description = "Role of the resource"
}

#Optional Variables
variable "attributes" {
  type        = "list"
  description = "Additional attributes"
  default     = []
}

variable "namespace" {
  type        = "string"
  description = "Namespace (Orginization or Project)"
  default     = ""
}
