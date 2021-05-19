resource "aws_lb_listener" "frontend_http" {
  load_balancer_arn = aws_lb.this.arn
  port     = var.http_alb_listeners_port
  protocol = var.http_alb_protocol
  default_action {
      type = "fixed-response"
      fixed_response {
          content_type = "text/plain"
          message_body = "Fixed response content"
          status_code = "200"
      }
  }
}
resource "aws_lb_listener_rule" "https_listener_rule" {
  count = length(aws_lb_target_group.main)  
  listener_arn = aws_lb_listener.frontend_http.arn
  action {
    type             = "forward"
    target_group_arn = "${aws_lb_target_group.main[count.index].arn}"
  }
  condition {
    path_pattern {
      values = ["/api/login/*"]
    }
  }
}