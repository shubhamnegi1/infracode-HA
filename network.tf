module "vpc" {
  source = "./modules/aws/network"
  tags = { 
    Project = "MyProject"
    Scope = "KPMG-test"
  }
  # The vpc,igw,nat,rt all will be taken care here
    vpc_cidr_block = "10.20.0.0/16"
    number_of_availability_zones_to_use = 2
    public_zone_custom_subnet_cidr_blocks = ["10.0.128.0/18", "10.0.192.0/18"]
    private_zone_custom_subnet_cidr_blocks = ["10.0.0.0/18", "10.0.64.0/18"]
    enable_dns_support = true
    enable_dns_hostnames = true
}