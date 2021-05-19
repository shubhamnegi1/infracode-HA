resource "aws_internet_gateway" "igw" {
  count = 1
  vpc_id = aws_vpc.vpc.id
}
