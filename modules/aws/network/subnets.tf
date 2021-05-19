data "aws_availability_zones" "available" {
  state                = "available"
}

resource "aws_subnet" "private_subnet" {
  count = var.number_of_availability_zones_to_use
  availability_zone = data.aws_availability_zones.available.names[count.index]
  cidr_block        = var.private_zone_custom_subnet_cidr_blocks[count.index]
  map_public_ip_on_launch = false
  vpc_id                  = aws_vpc.vpc.id
  tags = {
      "Name" = "private-zone-subnet"
    }
}
resource "aws_subnet" "public_subnet" {
  count = var.number_of_availability_zones_to_use
  availability_zone = data.aws_availability_zones.available.names[count.index]
  cidr_block        = var.public_zone_custom_subnet_cidr_blocks[count.index]
  map_public_ip_on_launch = false
  vpc_id                  = aws_vpc.vpc.id
  tags = {
      "Name" = "public-zone-subnet"
    }
}