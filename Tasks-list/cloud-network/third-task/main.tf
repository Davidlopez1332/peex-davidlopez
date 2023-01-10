resource "aws_instance" "vm1" {
  ami = var.ami
  instance_type = var.instance_type
  subnet_id = aws_subnet.snet-private.id
  security_groups = [aws_security_group.sg-vm1.name]
  key_name = "nebo1-keypair"
  tags = {
    Name = "vm1"
  }
}

resource "aws_instance" "vm2" {
  ami = var.ami
  instance_type = var.instance_type
  subnet_id = aws_subnet.snet-public.id
  security_groups = [aws_security_group.sg-vm2.name]
  tags = {
    Name = "vm2"
  }
}
