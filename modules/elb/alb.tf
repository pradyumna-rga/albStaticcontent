resource "aws_lb" "alb" {
  name               = "test-lb-tf"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.alb_sg.id]
  subnets            = [for subnet in aws_subnet.public : subnet.id]

  enable_deletion_protection = false

  tags = {
    Environment = "testing"
  }
}

//Target Group
resource "aws_lb_target_group" "albtg" {
  name        = "tf-example-lb-tg"
  port        = 80
  protocol    = "HTTP"
  target_type = "instance"
  vpc_id      = aws_vpc.my_vpc.id

  health_check {
    healthy_threshold   = 3
    unhealthy_threshold = 10
    timeout             = 5
    interval            = 10
    path                = "/"
    port                = 80
  }
}

//Attach the servers you wish to attch to LB
resource "aws_lb_target_group_attachment" "web_instance" {
  target_group_arn = aws_lb_target_group.albtg.arn
  count            = length(aws_instance.web)
  target_id        = aws_instance.web[count.index].id
  port             = 80
}

//Listener
resource "aws_lb_listener" "albl" {
  load_balancer_arn = aws_lb.alb.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.albtg.arn
  }
}
