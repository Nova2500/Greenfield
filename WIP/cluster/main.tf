##################################################################
# Providers
##################################################################
#Pulls in aws information
# provider "aws" {
#   region = "us-west-1"
# }

##################################################################
# Data sources & Locals
##################################################################

data "aws_availability_zones" "all" {}

data "aws_vpc" "default" {
  default = true
}

data "aws_subnet_ids" "all" {
  vpc_id = "${data.aws_vpc.default.id}"
}

data "aws_ami" "amazon_linux" {
  most_recent = true
  filter {
    name = "name"
    values = [
      "amzn-ami-hvm-*-x86_64-gp2",
    ]
  }
  filter {
    name = "owner-alias"
    values = [
      "amazon",
    ]
  }
}

##################################################################
# Resources
##################################################################
resource "aws_ebs_volume" "ec2_ebs" {
  availability_zone = "${module.ec2.availability_zone[0]}"
  size              = "${var.aws_ebs_volume_size}"
}
resource "aws_volume_attachment" "ec2" {
  device_name = "/dev/sdh"
  volume_id   = "${aws_ebs_volume.ec2_ebs.id}"
  instance_id = "${module.ec2.id[0]}"
}