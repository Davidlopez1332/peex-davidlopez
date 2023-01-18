resource "aws_security_group" "ec2" {
  name        = "allow_efs"
  description = "Allow efs outbound traffic"
  vpc_id      = aws_vpc.nebo-vpc.id

  ingress {
     from_port = 22
     to_port = 22
     protocol = "tcp"
     cidr_blocks = ["0.0.0.0/0"]
   }
  egress {
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    cidr_blocks     = ["0.0.0.0/0"]
  }
  tags = {
    Name = "allow_efs"
  }
}

resource "aws_security_group" "efs" {
   name = "efs-sg"
   description= "Allos inbound efs traffic from ec2"
   vpc_id = aws_vpc.nebo-vpc.id

   ingress {
     from_port = 2049
     to_port = 2049 
     protocol = "tcp"
     security_groups = [aws_security_group.ec2.id]
   }     
        
   egress {
     from_port = 0
     to_port = 0
     protocol = "-1"
     security_groups = [aws_security_group.ec2.id]
   }
 }