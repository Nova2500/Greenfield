##################################################################
# Networking Module - Main
##################################################################

data "aws_availability_zones" "available" {}

resource "aws_vpc" "tf_vpc" {
  cidr_block           = "${var.vpc_cidr}"
  enable_dns_hostnames = true
  enable_dns_support   = true

  tags {
    Name = "tf_vpc"
  }
}

resource "aws_internet_gateway" "tf_internet_gateway" {
  vpc_id = "${aws_vpc.tf_vpc.id}"

  tags {
    Name = "tf_igw"
  }
}

resource "aws_route_table" "tf_public_rt" {
  vpc_id = "${aws_vpc.tf_vpc.id}"

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.tf_internet_gateway.id}"
  }

  tags {
    Name = "tf_public"
  }
}

resource "aws_default_route_table" "tf_private_rt" {
  default_route_table_id = "${aws_vpc.tf_vpc.default_route_table.id}"

  tags {
    Name = "tf_private"
  }
}

resource "aws_subnet" "tf_public_subnet" {
  count                   = "${var.public_subnet_count}"
  vpc_id                  = "${aws_vpc.tf_vpc.id}"
  cidr_block              = "${var.public_cidrs[count.index]}"
  map_public_ip_on_launch = true
  availability_zone       = "${data.aws_availability_zones.available.names[count.index]}"

  tags {
    Name = "tf_public_${count.index + 1}"
  }
}

resource "aws_route_table_association" "tf_pubilc_assoc" {
  count          = "${var.public_subnet_count}"
  subnet_id      = "${aws_subnet.tf_public_subnet.*.id[count.index]}"
  route_table_id = "${aws_route_table.tf_public_rt.id}"
}

resource "aws_security_group" "tf_public_sg" {
  name        = "tf_public_sg"
  description = "Public instance access"
  vpc_id      = "${aws_vpc.tf_vpc.id}"

  #SSH Access

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["${var.accessip}"]
  }
  #HTTP Access
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["${var.accessip}"]
  }
  egress {
    from_port  = 0
    to_port    = 0
    protocol   = "-1"
    idr_blocks = ["0.0.0.0/0"]
  }
}
