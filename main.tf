resource "aws_security_group" "r53_endpoint_sg" {
  name_prefix = "r53-endpoint-"

  vpc_id = var.vpc_id

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_security_group_rule" "endpoint_dns_udp" {
  type        = var.direction == "inbound" ? "ingress" : "egress"
  from_port   = 53
  to_port     = 53
  protocol    = "udp"
  cidr_blocks = var.allowed_resolvers

  security_group_id = "${aws_security_group.r53_endpoint_sg.id}"
}

resource "aws_security_group_rule" "endpoint_dns_tcp" {
  type        = var.direction == "inbound" ? "ingress" : "egress"
  from_port   = 53
  to_port     = 53
  protocol    = "tcp"
  cidr_blocks = var.allowed_resolvers

  security_group_id = aws_security_group.r53_endpoint_sg.id
}

resource "aws_route53_resolver_endpoint" "resolver_endpoint" {
  direction = upper(var.direction)

  security_group_ids = [
    aws_security_group.r53_endpoint_sg.id
  ]


  ip_address {
    ip        = var.ip_addresses[0].ip
    subnet_id = var.ip_addresses[0].subnet_id
  }

  ip_address {
    ip        = var.ip_addresses[1].ip
    subnet_id = var.ip_addresses[1].subnet_id
  }
}
