variable "aws_region" {}
variable "aws_profile" {}
# pull the availablity zones from aws
data "aws_availability_zones" "available" {}
variable "vpc_cidr"  {}

variable "cidrs" {
  type = "map"
}

variable "domain_name" {}
