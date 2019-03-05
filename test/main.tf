module "test_vpc" {
  source          = "../module"
  region          = "us-west-2"
  profile         = "test-dev"
  name            = "shared-test"
  env_role        = "sandbox"
  azs             = ["us-west-2a", "us-west-2b"]
  cidr            = "172.30.126.0/24"
  public_subnets  = ["172.30.126.0/26", "172.30.126.64/26"]
  private_subnets = ["172.30.126.128/26", "172.30.126.196/26"]
}
