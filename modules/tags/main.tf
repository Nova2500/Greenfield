##################################################################################
# PROVIDERS
##################################################################################
locals {
  name         = "${lower(var.name)}"
  app          = "${lower(var.application)}"
  env_name     = "${lower(var.env_name)}"
  machine_role = "${lower(var.machine_role)}"
  attributes   = "${lower(var.attributes)}"
  namespace    = "${lower(var.namespace)}"
}
