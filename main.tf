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

resource "aws_instance" "example" {
  ami           = "ami-0c55b159cbfafe1f0"  # Amazon Linux 2 AMI (update for your region)
  instance_type = "t2.small"

  tags = {
    Name = "terraform-ec2-instance"
  }
}
