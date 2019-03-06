#Required Variables
variable "name" {
  description = "Resource Name  (e.g. `bastion` or `db`)"
}

variable "instance_count" {
  description = "Number of instanes to launch"
}

variable "ami" {
  description = "The AMI to use for the instance. By default it is the AMI provided by Amazon with Ubuntu 16.04"
}

variable "instance_type" {
  description = "The type of the instance"
}

variable "region" {
  description = "AWS Region the instance is launched in"
}

variable "availability_zone" {
  description = "Availability Zone the instance is launched in. If not set, will be launched in the first AZ of the region"
}

variable "subnet" {
  description = "VPC Subnet ID the instance is launched in"
}

variable "ssh_key_pair" {
  description = "SSH key pair to be provisioned on the instance"
}

variable "env" {
  description = "Environment (e.g. `dev`, `prod`"
}

#Optional Variables
variable "security_groups" {
  description = "List of Security Group IDs allowed to connect to the instance"
  type        = "list"
  default     = []
}

variable "root_volume_type" {
  description = "Type of root volume. Can be standard, gp2 or io1"
  default     = "gp2"
}

variable "root_volume_size" {
  description = "Size of the root volume in gigabytes"
  default     = "10"
}

variable "ebs_volume_count" {
  description = "Count of EBS volumes that will be attached to the instance"
  default     = "0"
}

variable "monitoring" {
  description = "Launched EC2 instance will have detailed monitoring enabled"
  default     = "true"
}

variable "tags" {
  description = "Additional tags"
  type        = "map"
  default     = {}
}

variable "ebs_volume_type" {
  description = "The type of EBS volume. Can be standard, gp2 or io1"
  default     = "gp2"
}

variable "ebs_volume_size" {
  description = "Size of the EBS volume in gigabytes"
  default     = "10"
}

variable "attributes" {
  description = "Additional attributes (e.g. `1`)"
  type        = "list"
  default     = []
}

variable "delete_on_termination" {
  description = "Whether the volume should be destroyed on instance termination"
  default     = "true"
}

variable "associate_public_ip_address" {
  description = "Associate a public IP address with the instance"
  default     = "true"
}

variable "assign_eip_address" {
  description = "Assign an Elastic IP address to the instance"
  default     = "true"
}

variable "private_ip" {
  description = "Private IP address to associate with the instance in the VPC"
  default     = ""
}
