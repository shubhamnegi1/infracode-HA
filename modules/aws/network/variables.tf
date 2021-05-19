variable "vpc_cidr_block" {
}
variable "tags" {
  type = map(string)
}
variable "number_of_availability_zones_to_use" {
}
variable enable_dns_support {
}
variable enable_dns_hostnames {
}

variable "public_zone_custom_subnet_cidr_blocks" {
  type    = list(string)
  default = ["none", "none"]
}
variable "private_zone_custom_subnet_cidr_blocks" {
  type    = list(string)
  default = ["none", "none"]
}

