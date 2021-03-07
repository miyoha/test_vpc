provider "aws" {
  region     = "us-east-1"
  access_key = "***"
  secret_key = "*****"
}

# Create a VPC
resource "aws_vpc" "miketerraform" {
  cidr_block = "10.0.0.0/16"
  
    tags = {
    Name = "miketerraform"
  }
}
resource "aws_subnet" "pubb" {
  vpc_id     = "${aws_vpc.miketerraform.id}"
  cidr_block = "10.0.1.0/24"
  map_public_ip_on_launch = true

  tags = {
    Name = "pubb"
  }
}
resource "aws_subnet" "pub22" {
  vpc_id     = "${aws_vpc.miketerraform.id}"
  cidr_block = "10.0.2.0/24"
  map_public_ip_on_launch = true

  tags = {
    Name = "pub22"
  }
}
