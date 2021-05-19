resource "aws_lb_target_group" "main" {
  count = length(var.target_groups)
  name        = lookup(var.target_groups[count.index], "name", null)  
  vpc_id      = var.vpc_id
  port        = lookup(var.target_groups[count.index], "backend_port", null)
  protocol    = lookup(var.target_groups[count.index], "backend_protocol", null) != null ? upper(lookup(var.target_groups[count.index], "backend_protocol")) : null
  target_type = lookup(var.target_groups[count.index], "target_type", null)

  health_check {
    path = "/api/login"
    matcher = "404"
  }
  depends_on = [aws_lb.this]
}

#resource "aws_lb_target_group_attachment" "test" {
#  count    = length(data.aws_instances.test.ids)
#  target_group_arn = aws_lb_target_group.main[count.index].arn
#  target_id        = data.aws_instances.test.ids[count.index]
#  port             = 80
#}