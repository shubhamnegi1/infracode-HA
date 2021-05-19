resource "aws_eip" "natgw_eip" {
  vpc   = true
}

resource "aws_nat_gateway" "natgw" {
  depends_on    = [aws_internet_gateway.igw]
  allocation_id = aws_eip.natgw_eip.id
  subnet_id     = aws_subnet.public_subnet[0].id
}
