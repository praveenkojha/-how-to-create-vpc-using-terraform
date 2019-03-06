provider "aws" {
  region  = "${var.aws_region}"
  profile = "${var.aws_profile}"
}

#--- VPC
resource "aws_vpc" "wp_vpc" {
  cidr_block = "${var.vpc_cidr}"
  enable_dns_hostnames = true
  enable_dns_support   = true

  tags {
   Name = "wp_vpc"
  }
}
#-- igW
resource "aws_internet_gateway" "wp_internet_gateway" {
  vpc_id = "${aws_vpc.wp_vpc.id}"

tags {
  Name = "wp_igw"
  }
}

#-- Route Table
resource "aws_route_table" "wp_public_rt" {
  vpc_id = "${aws_vpc.wp_vpc.id}"

 route {
  cidr_block = "0.0.0.0/16"
  gateway_id = "${aws_internet_gateway.wp_internet_gateway.id}"
}

tags {
  Name = "wp_public"
  }
}

resource "aws_default_route_table" "wp_private_rt" {
  default_route_table_id = "${aws_vpc.wp_vpc.default_route_table_id}"

 tags {
   Name = "wp_private"
  }
}
