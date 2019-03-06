##################################################################################
# PROVIDERS
##################################################################################
provider "aws" {
  profile = "${var.profile}"
  region  = "${var.region}"
}

locals {
  common_tags = "${map(
    "Name", "${lower(var.name)}",
    "Application", "${lower(var.application)}",
    "Env Name", "${lower(var.env_name)}",
    "Machine Role", "${lower(var.machine_role)}",
    "Managed By", "${lower(var.managed_by)}",
  )}"
}


##################################################################################
# RESOURCES
##################################################################################
resource "aws_instance" "server" {
  ami           = "ami-123456"
  instance_type = "t2.micro"

  tags = "${merge(
    local.common_tags,
    map(
      "Name", "awesome-app-server",
      "Role", "server"
    )
  )}"
}