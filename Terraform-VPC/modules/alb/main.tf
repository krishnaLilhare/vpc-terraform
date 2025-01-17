#alb
resource "aws_lb" "my_alb" {
  name               = "application-laod-balancer"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [var.sg_id]
  subnets            = var.subnets
}

#Listner
resource "aws_lb_listener" "listener" {
  load_balancer_arn = aws_lb.my_alb.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.tg.arn
  }
}

# Target Group
resource "aws_lb_target_group" "tg" {
  name     = "alb-tg"
  port     = 80
  protocol = "HTTP"
  vpc_id   = var.vpc_id
}

# Target Group attachment
resource "aws_lb_target_group_attachment" "tga" {
    count = length(var.instance)
  target_group_arn = aws_lb_target_group.tg.arn
  target_id        = var.instance[count.index]
  port             = 80
}
