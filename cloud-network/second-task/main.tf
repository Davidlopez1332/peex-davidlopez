resource "aws_instance" "vm_nebo1" {
  ami = var.ami
  instance_type = var.instance_type
  subnet_id     = aws_subnet.snet_public.id
  security_groups = ["${aws_security_group.nebo_sgp.name}"]
  key_name = "nebo1-keypair"
  tags = {
    Name = "VM-nebo1"
  }
}
