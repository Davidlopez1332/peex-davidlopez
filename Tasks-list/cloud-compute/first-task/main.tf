resource "aws_instance" "vm-nebo-linux" {
   ami = var.ami
   instance_type = var.instance_type
   security_groups = ["${aws_security_group.nebo_sgp.name}"]
   tags = {
      Name = "vm-nebo-linux"
           }
   key_name = "nebo1-keypair"
   subnet_id                   = aws_subnet.public_subnet.id
   associate_public_ip_address = true


}

terraform {
  backend "s3" {
    bucket = "terraform-state-dlopez"
    key    = "demo_cisco/terraform.tfstate"
    region = "us-west-2"
  }
  
}

resource "local_file" "tf_ansible_vars_file_new" {
  content = <<-DOC
    [vm-nebo-linux] 
    ${aws_eip.melasticeip.public_ip}
    DOC
  filename = "ansible/hosts.inv"
}