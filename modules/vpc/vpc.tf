resource "aws_vpc" "mod" {
  cidr_block = "${var.cidr}"
  tags       = "${local.tags}"
}

resource "aws_internet_gateway" "mod" {
  vpc_id = "${aws_vpc.mod.id}"
  tags   = "${local.tags}"
}

resource "aws_route_table" "public" {
  vpc_id = "${aws_vpc.mod.id}"
  tags   = "${local.tags}"
}

resource "aws_route" "public_internet_gateway" {
  route_table_id         = "${aws_route_table.public.id}"
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = "${aws_internet_gateway.mod.id}"
}

resource "aws_route" "private_nat_gateway" {
  count                  = "${length(var.private_subnets)}"
  route_table_id         = "${element(aws_route_table.private.*.id, count.index)}"
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = "${element(aws_nat_gateway.natgw.*.id, count.index)}"
}

resource "aws_route_table" "private" {
  vpc_id = "${aws_vpc.mod.id}"
  count  = "${length(var.private_subnets)}"
  tags   = "${local.tags}"
}

resource "aws_subnet" "private" {
  count             = "${length(var.private_subnets)}"
  vpc_id            = "${aws_vpc.mod.id}"
  cidr_block        = "${element(var.private_subnets, count.index)}"
  availability_zone = "${element(var.azs, count.index)}"
  tags              = "${local.tags}"
}

resource "aws_subnet" "public" {
  count             = "${length(var.public_subnets)}"
  vpc_id            = "${aws_vpc.mod.id}"
  cidr_block        = "${element(var.public_subnets, count.index)}"
  availability_zone = "${element(var.azs, count.index)}"
  tags              = "${local.tags}"

  map_public_ip_on_launch = true
}

resource "aws_eip" "nateip" {
  vpc   = true
  count = "${length(var.private_subnets)}"
}

resource "aws_nat_gateway" "natgw" {
  count         = "${length(var.private_subnets)}"
  allocation_id = "${element(aws_eip.nateip.*.id, count.index)}"
  subnet_id     = "${element(aws_subnet.public.*.id, count.index)}"

  depends_on = ["aws_internet_gateway.mod"]
}

resource "aws_route_table_association" "private" {
  count          = "${length(var.private_subnets)}"
  subnet_id      = "${element(aws_subnet.private.*.id, count.index)}"
  route_table_id = "${element(aws_route_table.private.*.id, count.index)}"
}

resource "aws_route_table_association" "public" {
  count          = "${length(var.public_subnets)}"
  subnet_id      = "${element(aws_subnet.public.*.id, count.index)}"
  route_table_id = "${aws_route_table.public.id}"
}
