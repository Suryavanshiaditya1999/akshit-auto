resource "aws_autoscaling_group" "frontend_autoscaling" {
  name                      = "frontend-autoscale"
  max_size                  = 2
  min_size                  = 1
  desired_capacity = 1
  health_check_grace_period = 300
  health_check_type         = "ELB"
  launch_template {
    id      = aws_launch_template.frontend_launch_template.id
    version = "$Default"
  }
  vpc_zone_identifier = [aws_subnet.frontend_subnet.id]
  target_group_arns = [aws_lb_target_group.frotend_target_group.arn]
  
}
