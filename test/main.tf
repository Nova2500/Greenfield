# Example usage for vpc Module
 module "test_vpc" {
   source          = "../vpc"
   region          = "us-west-2"
   profile         = "test-dev"
   name            = "shared-test"
   env_role        = "sandbox"
   azs             = ["us-west-2a", "us-west-2b"]
   cidr            = "172.30.126.0/24"
   public_subnets  = ["172.30.126.0/26", "172.30.126.64/26"]
   private_subnets = ["172.30.126.128/26", "172.30.126.196/26"]
}
# Example usage for Tags Module
module "test_tags" {
    #source        = "url/terraform-module-tags.git//compute?ref=master
    name          = "scores"
    application   = "pong"
    env_name      = "dev"
    machine_role  = "web"
    managed_by    = "terraform"
}