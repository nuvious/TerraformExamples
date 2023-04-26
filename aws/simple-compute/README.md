# Simple Compute Example

This is a basic example of deploying an EC2 instance and setting up SSH access.

## Quick Start

Create a terraform.tvars.json file and populate it with any/all of the following variables:

```json
{
    "ami_id": "ami-0d29ed4b66716fd4a",
    "aws_region": "us-east-1",
    "aws_availability_zone": "us-east-1a",
    "ingress_cidr_block": "0.0.0.0/0",
    "ssh_public_key_path": "~/.ssh/id_rsa.pub",
    "name": "simple-compute-test"
}
```

Then apply the terraform configuration

```bash
$:~/Teraform/aws/simple-compute $ terraform apply -auto-approve
...
# Lots of stuff should happen
...
Apply complete! Resources: 4 added, 0 changed, 0 destroyed.
```

Now you should be able to inspect your deployed resources. You can grab the
public IP from the eip resource

```bash
$:~/Teraform/aws/simple-compute $ terraform show
# aws_eip.eip:
resource "aws_eip" "eip" {
...
    public_ip            = "3.132.204.71"
...
}

# aws_instance.instance:
resource "aws_instance" "instance" {
   ...
}

# aws_internet_gateway.gateway:
resource "aws_internet_gateway" "gateway" {
...
}

# aws_key_pair.user_key:
resource "aws_key_pair" "user_key" {
...
}

# aws_route_table.routes:
resource "aws_route_table" "routes" {
...
}

# aws_route_table_association.subnet-association:
resource "aws_route_table_association" "subnet-association" {
...
}

# aws_security_group.ingress-security-group:
resource "aws_security_group" "ingress-security-group" {
  ...
}

# aws_subnet.default_subnet:
resource "aws_subnet" "default_subnet" {
 ...
}

# aws_vpc.vpc:
resource "aws_vpc" "vpc" {
...
}
```

You should be able to ssh in. For my AMI I picked an ubuntu image so the default
username is 'ubuntu':

```bash

$:~/Teraform/aws/simple-compute $ ssh ubuntu@192.18.56.23
Welcome to Ubuntu 22.04.2 LTS (GNU/Linux 5.19.0-1023-aws x86_64)
...
# Welcome banner stuff
...
ubuntu@ip-10-0-35-200:~$ 
```

## Cleanup

Simply run `terraform destroy` to clean up the instance when done.

```bash
$:~/Teraform/aws/simple-compute $ terraform destroy -auto-approve
...
Plan: 0 to add, 0 to change, 9 to destroy.
...
Destroy complete! Resources: 9 destroyed.
```

## References

https://medium.com/@hmalgewatta/setting-up-an-aws-ec2-instance-with-ssh-access-using-terraform-c336c812322f