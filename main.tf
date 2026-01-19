terraform {
  cloud {
    organization = "integrations-sdk"

    workspaces {
      name = "aws-ec2"
    }
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}

data "aws_ami" "amazon_linux" {
  most_recent = true

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-gp2"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["amazon"]
}

#resource "aws_instance" "example" {
#  ami           = data.aws_ami.amazon_linux.id
#  instance_type = "t2.small"
#
#  tags = {
#    Name = "terraform-ec2-instance"
#  }
#}

