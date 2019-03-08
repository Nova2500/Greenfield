##################################################################################
# PROVIDERS
##################################################################################
data "aws_caller_identity" "default" {}
data "aws_region" "default" {}
data "aws_subnet" "default" {
  id = "${var.subnet}"
}

data "aws_iam_policy_document" "default" {
  statement {
    sid = ""
    actions = [
      "sts:AssumeRole",
    ]
    principals {
      type        = "Service"
      identifiers = ["ec2.amazonaws.com"]
    }
    effect = "Allow"
  }
}

data "aws_ami" "default" {
  most_recent = "true"
  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-bionic-18.04-amd64-server-*"]
  }
  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
  owners = ["099720109477"]
}

data "aws_ami" "info" {
  filter {
    name   = "image-id"
    values = ["${var.ami}"]
  }
}

##################################################################################
# RESOURCES
##################################################################################

module "tags" {
  source      = "../tags"
  name        = "${var.name}"
  application = "${var.application}"
  environment = "${var.env_name}"
  machine_role= "${var.machine_role}"
}

resource "aws_iam_role" "default" {
  count              = "${var.instance_count}"
  name               = "${var.name}"
  path               = "/"
  assume_role_policy = "${data.aws_iam_policy_document.default.json}"
}

resource "aws_instance" "default" {
  instance_count              = "${var.instance_count}"
  ami                         = "${var.ami}"
  instance_type               = "${var.instance_type}"
  region           = "${var.region}"
  availability_zone           = "${var.availability_zone}"
  subnet                      = "${var.subnet}"
  ssh_key_pair                = "${var.ssh_key_pair}"
  env                         = "${var.env}"
  user_data                   = "${var.user_data}"
  security_group              = "${var.security_group}"
  root_block_device {
    volume_type               = "${var.root_volume_type}"
    volume_size               = "${var.root_volume_size}"
    delete_on_termination     = "${var.delete_on_termination}"
  }
  monitoring                  = "${var.monitoring}"
  attributes                  = "${var.attributes}"
  associate_public_ip_address = "${var.associate_public_ip_address}"
  private_ip                  = "${var.private_ip}"
  add_tags                    = "${var.add_tags}"
  ebs_volume_count            = "${var.ebs_volume_count}"
}

resource "aws_ebs_volume" "default" {
  count             = "${var.ebs_volume_count}"
  availability_zone = "${var.availability_zone}"
  type              = "${var.ebs_volume_type}"
  size              = "${var.ebs_volume_size}"
  tags              = "${var.add_tags}"
}

resource "aws_iam_instance_profile" "default" {
  count = "${var.instance_count}"
  name  = "${var.name}"
  role  = "${aws_iam_role.default.name}"
}

resource "aws_volume_attachment" "default" {
  count       = "${var.ebs_volume_count}"
  volume_id   = "${element(aws_ebs_volume.default.*.id, count.index)}"
  instance_id = "${aws_instance.default.id}"
}
