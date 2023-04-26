resource "aws_subnet" "default_subnet" {
  cidr_block        = cidrsubnet(aws_vpc.vpc.cidr_block, 3, 1)
  vpc_id            = aws_vpc.vpc.id
  availability_zone = "${var.aws_availability_zone}"
  tags = var.tags
}

resource "aws_route_table" "routes" {
  vpc_id            = aws_vpc.vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.gateway.id}"
  }
  tags = var.tags
}

resource "aws_route_table_association" "subnet-association" {
  subnet_id = "${aws_subnet.default_subnet.id}"
  route_table_id = "${aws_route_table.routes.id}"
}