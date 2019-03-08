#Required Variables
variable "name" {
  description = "Resource Name  (e.g. `bastion` or `db`)"
}

variable "instance_count" {
  description = "Number of instanes to launch"
}

variable "ami" {
  description = "The AMI to use for the instance"
}

variable "instance_type" {
  description = "The type of the instance"
}

variable "region" {
  description = "AWS Region in which the instance is launched"
}

variable "availability_zone" {
  type = "list"
  description = "Availability Zone in which the instance is launched"
}

variable "subnet" {
  description = "VPC Subnet ID in which the instance is launched"
}

variable "ssh_key_pair" {
  description = "SSH key pair to be provisioned on the instance"
}

variable "env" {
  description = "Environment (e.g. `dev`, `prod`)"
}
variable "user_data" {
  description = "User Data provided to instance"
  default = ""
}

#Optional Variables
variable "security_group" {
  type        = "list"
  description = "List of Security Group IDs allowed to connect to the instance"
  default     = []
}

variable "cidr" {
  type        = "list"
  description = "The CIDR block for the VPC"
  default = ["0.0.0.0/0"]
}

variable "root_volume_type" {
  description = "Type of root volume. Can be standard, gp2 or io1"
  default     = "gp2"
}

variable "root_volume_size" {
  description = "Size of the root volume in gigabytes"
  default     = "10"
}

variable "delete_on_termination" {
  description = "Whether the volume should be destroyed on instance termination"
  default     = "true"
}

variable "monitoring" {
  description = "Launched EC2 instance will have detailed monitoring enabled"
  default     = "true"
}

variable "attributes" {
  description = "Additional attributes (e.g. `1`)"
  type        = "list"
  default     = []
}

variable "associate_public_ip_address" {
  description = "Associate a public IP address with the instance"
  default     = "true"
}

variable "private_ip" {
  description = "Private IP address to associate with the instance in the VPC"
  default     = ""
}

variable "assign_eip_address" {
  description = "Assign an Elastic IP address to the instance"
  default     = "true"
}
variable "ebs_volume_count" {
  description = "Count of EBS volumes that will be attached to the instance"
  default     = "0"
}
variable "ebs_volume_type" {
  description = "The type of EBS volume. Can be standard, gp2 or io1"
  default     = "gp2"
}

variable "ebs_volume_size" {
  description = "Size of the EBS volume in gigabytes"
  default     = "10"
}

variable "add_tags" {
  description = "Additional tags"
  type        = "map"
  default     = {}
}
