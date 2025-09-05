# Security Group para o ALB
resource "aws_security_group" "alb_sg" {
  name        = "alb-sg-${terraform.workspace}"
  vpc_id      = var.vpc_id

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] # público
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = var.tags
}

# ALB
resource "aws_lb" "alb" {
  name               = "alb-${terraform.workspace}"
  load_balancer_type = "application"
  subnets            = var.public_subnets
  security_groups    = [aws_security_group.alb_sg.id]

  tags = var.tags
}

# Target Group
resource "aws_lb_target_group" "tg" {
  name     = "tg-${terraform.workspace}"
  port     = 80
  protocol = "HTTP"
  vpc_id   = var.vpc_id

  health_check {
    path                = "/"
    protocol            = "HTTP"
    healthy_threshold   = 2
    unhealthy_threshold = 2
    timeout             = 5
    interval            = 30
  }

  tags = var.tags
}

# Listener
resource "aws_lb_listener" "listener" {
  load_balancer_arn = aws_lb.alb.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.tg.arn
  }
}

# Registrar EC2 no Target Group
resource "aws_lb_target_group_attachment" "tg_attachment" {
  count            = length(var.target_instances)
  target_group_arn = aws_lb_target_group.tg.arn
  target_id        = var.target_instances[count.index]
  port             = 80
}
