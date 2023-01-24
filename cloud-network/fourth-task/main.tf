resource "aws_instance" "nebo-machine" {
  ami = var.ami
  instance_type = var.instance_type
  vpc_security_group_ids = [aws_security_group.nebo-sg.id]
  subnet_id     = aws_subnet.nebo-public.id
  associate_public_ip_address = true
  key_name = "nebo1-keypair"
  tags = {
    Name = "nebo-machine"
  }
}
