# Simple Compute Example

This is a basic example of deploying an EC2 instance and setting up SSH access.

## Quick Start

Create a terraform.tvars.json file and populate it with any/all of the following variables:

```json
{
    "ami_id": "ami-0d29ed4b66716fd4a",
    "aws_region": "us-east-2",
    "aws_availability_zone": "us-east-2a",
    "ingress_cidr_block": "0.0.0.0/0",
    "instance_type": "t2.micro",
    "profile": "default",
    "ssh_public_key_path": "~/.ssh/id_rsa.pub",
    "tags": {
        "Name": "my-simple-compute-test"
    }
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
$:~/Teraform/aws/simple-compute $ terraform show | grep public_ip
    public_ip            = "192.18.56.23"
    public_ipv4_pool     = "amazon"
    associate_public_ip_address          = false
    map_public_ip_on_launch                        = false
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