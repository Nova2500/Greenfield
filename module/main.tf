#Got an idea: start a new repo (just locally) for a `terraform-module-vpc` and build out a vpc module catered to the following inputs:
#- region
#- name
#- env_role
#- cidr
#- private_subnets (list)
#- public_subnets (list)

#Module should create a vpc with appropriate subnets and NAT gateways. Should utilize same number of AZs as private_subnets.

##################################################################################
# PROVIDERS
##################################################################################

provider "aws" {
  profile = "${var.profile}"
  region  = "${var.region}"
}

locals {
  env_role = "${lower(var.env_role)}"

  tags = "${map(
      "Env Role", "${lower(var.env_role)}",
  )}"
}

##################################################################################
# RESOURCES
##################################################################################

resource "aws_instance" "nginx" {
  ami           = "ami-c58c1dd3"
  instance_type = "t2.micro"
  key_name      = "${var.key_name}"

  connection {
    user        = "ec2-user"
    private_key = "${file(var.private_key_path)}"
  }

  provisioner "remote-exec" {
    inline = [
      "sudo yum install nginx -y",
      "sudo service nginx start",
    ]
  }

  tags = "${local.tags}"
}
