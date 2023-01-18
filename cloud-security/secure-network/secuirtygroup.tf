resource "aws_security_group" "sg-vm1" {
  name = "secg-vm1"
  vpc_id = aws_vpc.vnet-nebo.id

  ingress {
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = [aws_instance.vm2.public_ip]
  }
  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_security_group" "sg-vm2" {
  name = "secg-vm2"
  vpc_id = aws_vpc.vnet-nebo.id
  
  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}