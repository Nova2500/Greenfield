# Example usage for vpc module
 module "test_vpc" {
   source          = "../modules/vpc"
   region          = "${var.region}"
   profile         = "${var.profile}"
   name            = "${var.name}"
   env_role        = "${var.env_role}"
   azs             = "${var.azs}"
   cidr            = "${var.cidr}"
   public_subnets  = "${var.public_subnets}"
   private_subnets = "${var.private_subnets}"
   tags            = "${module.test_tags.tag_map}"
}


# Example usage for ec2 module
 module "test_ec2" {
   source          = "../modules/ec2"
   name            = "${var.name}"
   instance_count  = "${var.instance_count}"
   ami             = "${var.ami}"
   instance_type   = "${var.instance_type}"
   region          = "${var.region}"
   azs             = "${var.azs}"
   subnet          = "${var.subnet}"
   ssh_key_pair    = "${var.ssh_key_pair}"
   env             = "${var.env}"
   tags            = "${module.test_tags.tag_map}"
}


# Example usage for Tags module
module "test_tags" {
    source        = "../modules/tags"
    name          = "${var.name}"
    application   = "${var.application}"
    env_name      = "${var.env_name}"
    machine_role  = "${var.machine_role}"
    attributes    = "${var.attributes}"
    namespace     = "${var.namespace}"
}


# Example usage for Bucket module
module "test_bucket" {
    source        = "../modules/s3"
    name          = "${var.name}"
    tags          = {
      BillingCode = "${var.billing_code_tag}"
      Environment = "${var.environment_tag}"
    }
}