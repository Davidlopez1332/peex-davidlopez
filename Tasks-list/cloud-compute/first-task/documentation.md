# Cloud compute and Infraestructure as Code documentation
This Terraform configuration is used to create a virtual machine (VM) and the necessary network infrastructure to support it in the AWS cloud.

## Resources
The following resources are created by this configuration:

- aws_instance: An EC2 instance running the specified AMI.
- aws_eip: An Elastic IP address that is associated with the EC2 instance.
- aws_vpc: A virtual private cloud (VPC) with a specified CIDR block.
- aws_subnet: A public subnet within the VPC.
- aws_route_table: A route table for the public subnet, which routes traffic to the Internet via an Internet gateway.
- aws_internet_gateway: An Internet gateway for the VPC.
- local_file: A local file that contains the public IP address of the EC2 instance.
- aws_security_group: A security group that allows incoming SSH connections from a specified IP address and allows all outgoing traffic.

## Outputs
The following outputs are defined in this configuration:

- ec2_machine: The EC2 instance that was created.
- EIP: The Elastic IP address that was associated with the EC2 instance.

## Variables
The following variables are used in this configuration:

- ami: The ID of the AMI to use for the EC2 instance.
- instance_type: The type of the EC2 instance.
- region: The region in which to create the resources.