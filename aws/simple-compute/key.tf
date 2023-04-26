resource "aws_key_pair" "user_key" {
  key_name   = "user_key"
  public_key = file("${var.ssh_public_key_path}")
  tags = var.tags
}