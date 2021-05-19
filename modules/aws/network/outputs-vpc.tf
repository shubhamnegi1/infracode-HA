output "vpc_id" {
  value = ["${aws_vpc.vpc}"]
}
output "private_subnet_id" {
  value = ["${aws_subnet.private_subnet.*.id}"]
}