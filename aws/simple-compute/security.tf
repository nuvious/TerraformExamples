resource "aws_security_group" "ingress-security-group" {
  name = "allow-home-net"

  vpc_id = aws_vpc.vpc.id

  // allow ssh inbound
  ingress {
    cidr_blocks = [
      "${var.ingress_cidr_block}"
    ]
    from_port = 22
    to_port   = 22
    protocol  = "tcp"
  }

  // allow all outbound
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = var.tags
}