resource "aws_security_group" "nebo_sgp" {
  name   = "allow_rdp"
  vpc_id = aws_vpc.nebo-vpc.id

  ingress {
    from_port   = 3389
    to_port     = 3389
    protocol    = "tcp"
    cidr_blocks = ["10.239.132.89"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["8.8.8.8/32"]
  }
}
