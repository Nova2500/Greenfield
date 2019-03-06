output "tag_map" {
  value = "${map(
      "Name", "${local.name}", # name of resource
      "Application", "${local.application}", # app name
      "Environment", "${local.env_name}", # dev, qa, prod
      "Machine Role", "${local.machine_role}", # app, db, build
      "Managed By", "${local.managed_by}",#terraform
      "Attributes", "${local.attributes}", #attributes
      "Namespace", "${local.namespace}", #namespace
      "Additional tags", "${local.add_tags}" #additional tags
    )}"
}

