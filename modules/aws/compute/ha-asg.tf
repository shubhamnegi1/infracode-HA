resource "aws_autoscaling_group" "asg" {
 count = var.ha=="yes"?1:0 
  name                = "Autoscaling-group-${var.name}-launch-template-version-${aws_launch_template.launch_template[count.index].latest_version}"
  min_size            = 2
  max_size            = 2
  desired_capacity    = 2
  health_check_type   = "EC2"
  vpc_zone_identifier = var.target_subnets
  launch_template {
    id      = aws_launch_template.launch_template[count.index].id
    version = "$Latest"
  }
}
