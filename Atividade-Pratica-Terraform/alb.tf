resource "aws_lb" "load-balancer-irede" {
  name = "irede-loadbalancer"
  internal = false
  load_balancer_type = "application"
  security_groups = [ "sg-0774c692096dca148" ]
  subnets = [ "subnet-036d7bd09b5503ff0", "subnet-0f2ffbd010f2160de", "subnet-07bba3a7f0af08957", "subnet-02b41a8242624e6d1", "subnet-00cba94202692890b", "subnet-03620b0099e21a445" ]

  enable_deletion_protection = false
  enable_http2 = true
  idle_timeout = 60
}

resource "aws_lb_listener" "my_listener" {
  load_balancer_arn = aws_lb.load-balancer-irede.arn
  port = 80
  protocol = "HTTP"

  default_action {
    target_group_arn = aws_lb_target_group.terraform-dg.arn
    type = "forward"
  }
}

resource "aws_lb_target_group" "terraform-dg" {
  name = "tf-dg"
  port = 80
  protocol = "HTTP"
  target_type = "instance"
  vpc_id = "vpc-0a37c3c67558a00e7"
}

resource "aws_lb_target_group_attachment" "terraform-Gec2" {
  count = 2
  target_group_arn = aws_lb_target_group.terraform-dg.arn
  target_id = aws_instance.ec2-irede[count.index].id
  port = 80
}