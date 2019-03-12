aws_profile = "xxxxx"
aws_region  = "xxxxx"
vpc_cidr    = "x.x.x.x/16"

#writing the set of cidrs ip that we need in our subnet creation
#cidr_block = "${var.cidrs["public1"]}"
cidrs       = {
  public1  = "10.0.1.0/24"
  public2  = "10.0.2.0/24"
  private1 = "10.0.3.0/24"
  private2 = "10.0.4.0/24"
  rds1      = "10.0.5.0/24"
  rds2     = "10.0.6.0/24"
  rds3     = "10.0.7.0/24"
}


domain_name = "your-domain.com"

