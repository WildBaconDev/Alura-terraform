# provider "aws" {
#     version = "~> 3.0"
#     region  = "us-east-1"
# }

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "dev" {
    count = 3
    ami = "ami-09e67e426f25ce0d7"
    instance_type = "t2.micro"
    key_name = "terraform-aws"
    tags = {
      "Name" = "dev${count.index}"
    }

    vpc_security_group_ids = [ "${aws_security_group.acesso-ssh.id}" ]
}

resource "aws_instance" "dev4" {
    ami = "ami-09e67e426f25ce0d7"
    instance_type = "t2.micro"
    key_name = "terraform-aws"
    tags = {
      "Name" = "dev4"
    }

    vpc_security_group_ids = [ "${aws_security_group.acesso-ssh.id}" ]

    depends_on = [aws_s3_bucket.dev4]
}

resource "aws_instance" "dev5" {
    ami = "ami-09e67e426f25ce0d7"
    instance_type = "t2.micro"
    key_name = "terraform-aws"
    tags = {
      "Name" = "dev5"
    }

    vpc_security_group_ids = [ "${aws_security_group.acesso-ssh.id}" ]
}

resource "aws_security_group" "acesso-ssh" {
  name        = "acesso-ssh"
  description = "acesso-ssh"

  ingress = [
    {
        description      = "acesso-ssh"
        from_port        = 22
        to_port          = 22
        protocol         = "tcp"
        cidr_blocks      = ["189.6.118.158/32"]
        ipv6_cidr_blocks = []
        prefix_list_ids = []
        security_groups = []
        self = false
    }
  ]

  tags = {
    Name = "ssh"
  }
}

resource "aws_s3_bucket" "dev4" {
  bucket = "davimirandalabs-dev4"
  acl    = "private"

  tags = {
    Name = "davimirandalabs-dev4"
  }
}