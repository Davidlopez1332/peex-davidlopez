resource "aws_security_group" "nebo_sgp" {
  name   = "allow_rdp"
  vpc_id = aws_vpc.nebo-vpc.id

  ingress {
    from_port   = 3389
    to_port     = 3389
    protocol    = "tcp"
    cidr_blocks = ["56.209.118.76", "255.211.77.100"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["8.8.8.8/32"]
  }
}
