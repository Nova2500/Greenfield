output "tags" {
  value = "${map(
      "Name", "${local.name}", # name of resource
      "Application", "${local.application}", # app name
      "Environment", "${local.env_name}", # dev, qa, prod
      "Machine Role", "${local.machine_role}", # app, db, build
      "managed_by", "${local.managed_by}" #terraform
    )}"
}