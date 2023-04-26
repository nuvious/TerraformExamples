variable "ami_id" {
  type    = string
  default = "ami-0d29ed4b66716fd4a"
}
variable "aws_region" {
  type = string
  default = "us-east-1"
}
variable "aws_availability_zone" {
  type = string
  default = "us-east-1a"
}
variable "ingress_cidr_block" {
  type = string
  default = "0.0.0.0/0"
}
variable "instance_type" {
  type = string
  default = "t2.micro"
}
variable "profile" {
  type = string
  default = "default"
}
variable "ssh_public_key_path" {
  type = string
  default = "~/.ssh/id_rsa.pub"
}
variable "tags" {
  type = map
  default = {
    Name = "simple-compute-test"
  }
}