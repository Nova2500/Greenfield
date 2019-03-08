# Example usage for vpc module
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
   tags            = "${module.tags.tag_map}"
}


# Example usage for ec2 module
 module "test_ec2" {
   source          = "../ec2"
   name            = "test-cluster"
   instance_count  = "3"
   ami             = "ami-abc123"
   instance_type   = "t2.micro"
   region          = "US-East-1"
   azs             = "US-East-1a"
   subnet          = "subnet-use1a"
   ssh_key_pair    = "Master"
   env             = "dev"
   tags            = "${module.tags.tag_map}"
}


# Example usage for Tags module
module "test_tags" {
    source        = "../"
    name          = "scores"
    application   = "pong"
    env_name      = "dev"
    machine_role  = "web"
}