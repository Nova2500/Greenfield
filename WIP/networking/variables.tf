##################################################################
# Networking Module - Variables
##################################################################

variable "vpc_cidr" {}

variable "public_subnet_count" {}

variable "public_cidrs" {
  type = "list"
}

variable "accessip" {}
