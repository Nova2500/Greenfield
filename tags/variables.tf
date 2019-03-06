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

variable "managed_by" {
  description = "Entity which is managing the resource"
}

variable "delimiter" {
  type        = "string"
  default     = "-"
  description = "Delimiter between `name`, `application`..."
}

#Optional Variables
variable "attributes" {
  type = "list"
  description = "Additional attributes"
  default = []
}

variable "namespace" {
  description = "Namespace (Orginization or Project)"
}

variable "add_tags" {
  type = "map"
  description = "Additional tags"
  default = {}
}
