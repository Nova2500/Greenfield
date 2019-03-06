##################################################################################
# PROVIDERS
##################################################################################
provider "aws" {
  profile = "${var.profile}"
  region  = "${var.region}"
}

locals {
  "name" = "${lower(join(var.delimiter,var.name))}",
  "app" = "${lower(join(var.delimiter,var.application))}",
  "env_name" = "${lower(join(var.delimiter,var.env_name))}",
  "machine_role" = "${lower(join(var.delimiter,var.machine_role))}",
  "managed_by" = "${lower(join(var.delimiter,var.managed_by))}"

  "attributes" = "${lower(join(var.delimiter, var.attributes))}",
  "namespace" = "${lower(join(var.delimiter,var.namespace))}",
  "add_tags"= "${lower(join(var.delimiter,var.add_tags))}"
}