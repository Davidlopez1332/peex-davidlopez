output "ec2_machine" { 
  value = aws_instance.vm-nebo-linux
}

output "EIP" {
  value = aws_eip.melasticeip.public_ip
}