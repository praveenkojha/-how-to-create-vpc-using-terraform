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


#---subnet we have to deploy 7 subnet  ---

#Specify your subnet's IP address block in CIDR format; for example, 10.0.0.0/24.
#IPv4 block sizes must be between a /16 netmask and /28 netmask, and can be the same size as your VPC.

resource "aws_subnet" "wp_public1_subnet"{
  vpc_id = "${aws_vpc.wp_vpc.id}"
  cidr_block = "${var.cidrs["public1"]}"
  map_public_ip_on_launch = true
#  availability_zone = "${data.aws_availablity_zone.available.names[0]}"

  tags {
    Name = "wp_public1"
 }
}

resource "aws_subnet" "wp_public2_subnet" {
  vpc_id = "${aws_vpc.wp_vpc.id}"
  cidr_block = "${var.cidrs["public2"]}"
  map_public_ip_on_launch = true

tags {
  Name = "wp_public2"
  }
}

resource "aws_subnet" "wp_private1_subnet" {
  vpc_id = "${aws_vpc.wp_vpc.id}"
  cidr_block = "${var.cidrs["private1"]}"
  map_public_ip_on_launch = false

tags {
  Name = "wp_private1"
 }
}

resource "aws_subnet" "wp_private2_subnet" {
  vpc_id = "${aws_vpc.wp_vpc.id}"
  cidr_block = "${var.cidrs["private2"]}"
  map_public_ip_on_launch = false

tags {
  Name = "wp_private2"
 }
}


resource "aws_subnet" "wp_rds1_subnet" {
  vpc_id = "${aws_vpc.wp_vpc.id}"
  cidr_block = "${var.cidrs["rds1"]}"
  map_public_ip_on_launch = false

tags {
  Name = "wp_rds1"
 }
}

resource "aws_subnet" "wp_rds2_subnet" {
  vpc_id = "${aws_vpc.wp_vpc.id}"
  cidr_block = "${var.cidrs["rds2"]}"
  map_public_ip_on_launch = false

tags {
  Name = "wp_rds2"
 }
}

resource "aws_subnet" "wp_rds3_subnet" {
  vpc_id = "${aws_vpc.wp_vpc.id}"
  cidr_block = "${var.cidrs["rds3"]}"
  map_public_ip_on_launch = false

tags {
  Name = "wp_rds3"
 }
}
