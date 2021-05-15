terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.27"
    }
  }

  required_version = ">= 0.14.9"
}

provider "aws" {
  profile = "default"
  region  = "sa-east-1"
}

resource "aws_instance" "app_server" {
  ami           = "ami-05373777d08895384"
  instance_type = "t2.micro"

  vpc_security_group_ids = ["sg-ff2f588c"]
  subnet_id              = "subnet-41e07a1a"

  tags = {
    Name = "ExampleAppServerInstance"
  }
}
