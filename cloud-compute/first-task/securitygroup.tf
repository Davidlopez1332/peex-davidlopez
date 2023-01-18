resource "aws_security_group" "nebo_sgp" {
  name        = "nebo_sgp"

  ingress {
    description = "SSH"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["10.239.132.89/32"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = -1
    cidr_blocks      = ["0.0.0.0/0"]
  }
}