##################################################################
# Modules
##################################################################
module "ec2" {
  source                      = "../../"
  instance_count              = 1
  region                      = "us-west-1"
  name                        = "ebs"
  ami                         = "Dev"
  instance_type               = "t2.micro"
  subnet_id                   = "${element(data.aws_subnet_ids.all.ids, 0)}"
  vpc_security_group_ids      = ["${module.security_group.this_security_group_id}"]
  associate_public_ip_address = true
}

module "security_group" {
  source              = "../"
  name                = "default"
  description         = "Security group for EC2 instance"
  vpc_id              = "${data.aws_vpc.default.id}"
  ingress_cidr_blocks = ["0.0.0.0/0"]
  ingress_rules       = ["http-80-tcp", "all-icmp"]
  egress_rules        = ["all-all"]
}
