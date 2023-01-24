resource "aws_network_acl" "nebo-acl" {
  vpc_id = aws_vpc.nebo-vpc.id

  ingress {
    protocol   = "tcp"
    rule_no    = 100
    action     = "allow"
    cidr_block = "10.3.0.0/18"
    from_port  = 80
    to_port    = 80
  }

  egress {
    protocol = "-1"
    rule_no = 200
    action = "allow"
    cidr_block = "0.0.0.0/0"
    from_port = 0
    to_port = 0
  }

  tags = {
    Name = "nebo-acl"
  }
}

