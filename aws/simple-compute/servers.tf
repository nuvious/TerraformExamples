resource "aws_instance" "instance" {
  ami           = "${var.ami_id}"
  instance_type = "t2.micro"
  key_name      = "user_key"
  security_groups = ["${aws_security_group.ingress-security-group.id}"]
  subnet_id = "${aws_subnet.default_subnet.id}"
  tags = {
    Name = "${var.name}"
  }
}