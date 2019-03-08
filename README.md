#First
First



# TODO - tag module
```
# tag module /compute
[...]
output "tag_map" {
  value = "${map(
      "Name", "${local.name}", # name of resource
      "Application", "${local.application}", # app name
      "Environment", "${local.env_name}", # dev, qa, prod
      "Machine Role", "${local.machine_role}", # app, db, build
      "managed_by", "${local.managed_by}"
    )}"
}
```

```
# Example usage
module "instance_tags" {
    source = "url/terraform-module-tags.git//compute?ref=master
    name = "test"
    application = "test"
    env_name = "dev"
    machine_role = "app"
}

resource "ec2_instance" {
    [...]
    tags = "${module.instance_tags.tag_map}
}
```