# Required
variable "region" {
  description = "Region to be used"
}

variable "profile" {
  description = "AWS profile used to execute terraform"
}

variable "azs" {
  type        = "list"
  description = "A list of Availability zones in the region"
}

variable "public_subnets" {
  type        = "list"
  description = "A list of Public Subnets"
}

variable "private_subnets" {
  type        = "list"
  description = "A list of Private Subnets"
}

variable "name" {
  description = "Name to be used on all the resources as identifier"
}

variable "cidr" {
  description = "The CIDR block for the VPC"
}

variable "env_role" {
  description = "Environment role for vpc"
}

# Optional
variable "key_name" {
  default = "default"
}
