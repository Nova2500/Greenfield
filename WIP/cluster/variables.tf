##################################################################
# Variables
##################################################################
variable "region" {
  description = "AWS Region for the resource"
}

variable "az" {
  description = "AWS Availability Zone for the resource"
}

variable "env_role" {
  description = "Environment Role ('Dev', 'Test, or 'Prod')"
}

variable "name" {
  description = "Name of the Instance"
}

variable "ami" {
  type        = "map"
  description = "AWS AMI to be used ('Dev', 'Test', or 'Prod')"

  default = {
    Dev  = "${data.aws_ami.amazon_linux.id}"
    Test = "${data.aws_ami.amazon_linux.id}"
    Prod = "${data.aws_ami.amazon_linux.id}"
  }
}

variable "aws_ebs_volume_size" {
  description = "EBS Volume Size"
  default     = 1
}
