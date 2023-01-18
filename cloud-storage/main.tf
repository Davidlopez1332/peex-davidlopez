resource "aws_instance" "vm-nebo-linux" {
   ami = var.ami
   instance_type = var.instance_type
   security_groups = ["${aws_security_group.ec2.name}"]
   tags = {
      Name = "vm-nebo-linux"
           }
   key_name = "nebo1-keypair"
   subnet_id = aws_subnet.nebo-private.id
   associate_public_ip_address = true


}

resource "aws_efs_file_system" "efs" {
   creation_token = "efs"
   performance_mode = "generalPurpose"
   throughput_mode = "bursting"
   encrypted = "true"
 tags = {
     Name = "EFS"
   }
 }


resource "aws_efs_mount_target" "efs-mt" {
   file_system_id  = aws_efs_file_system.efs.id
   subnet_id = aws_subnet.nebo-private.id
   security_groups = [aws_security_group.efs.id]
 }
