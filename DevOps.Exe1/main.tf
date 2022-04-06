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
  region = "us-west-2"
}

# Create a VPC
resource "aws_vpc" "shai-vpc" {
  cidr_block = "192.168.1.0/24"
  tags = {
    "name" = "shai-vpc"
  }
}

# Subnet_Web
resource "aws_subnet" "Subnet_Web" {
  vpc_id = aws_vpc.shai-vpc.id
  cidr_block = "192.168.1.0/27"

  tags = {
    name = "Subnet_Web"
  }
}

# Subnet_App start from 32 becouse prev subnet
resource "aws_subnet" "Subnet_App" {
   vpc_id = aws_vpc.shai-vpc.id
   cidr_block = "192.168.1.32/27"

  tags = {
    name = "Subnet_App"
  }
}

# Subnet_DB start from 64 becouse prev subnet
resource "aws_subnet" "Subnet_DB" {
    vpc_id = aws_vpc.shai-vpc.id
    cidr_block = "192.168.1.64/28"

  tags = {
    name = "Subnet_DB"
  }
}