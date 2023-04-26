resource "aws_vpc" "vpc" {
  cidr_block           = "10.0.0.0/16"
  enable_dns_hostnames = true
  enable_dns_support   = true
  tags = var.tags
}

resource "aws_eip" "eip" {
  instance = "${aws_instance.instance.id}"
  vpc = true
  tags = var.tags
}