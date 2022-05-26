provider "aws" {
  region = "us-west-2"
}

resource "aws_instance" "EC2_instance" {
  ami           = "ami-08d70e59c07c61a3a"
  instance_type = "t2.micro"
  tags = {
    Name = var.instance_name
  }
}

/*
resource "aws_s3_bucket" "state_s3_bucket" {
  bucket = "lab4-state-terraform"
  tags = {
    Name        = "state bucket"
    Environment = "Dev"
  }
} */

terraform {
  backend "s3" {
    bucket = "lab4-state-terraform"
    key    = "lab4-state-terraform" 
    region = "us-west-2"
  }
}
