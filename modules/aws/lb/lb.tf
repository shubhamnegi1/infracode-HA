resource "aws_lb" "this" {
  name        = var.name
  internal           = var.internal
  load_balancer_type = var.load_balancer_type
  security_groups    = ["aws_security_group.alb_sg.id"]
  subnets            = var.subnets

  enable_deletion_protection       = var.enable_deletion_protection
  enable_cross_zone_load_balancing = var.enable_cross_zone_load_balancing
}