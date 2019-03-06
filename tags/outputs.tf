output "tag_map" {
  value = "${map(
      "Name", "${local.name}",
      "Application", "${local.application}",
      "Environment", "${local.env_name}",
      "Machine Role", "${local.machine_role}",
      "Managed By", "Terraform",
      "Attributes", "${local.attributes}",
      "Namespace", "${local.namespace}"
    )}"
}

