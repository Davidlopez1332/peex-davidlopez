resource "aws_eip" "melasticeip" {
  instance = aws_instance.vm-nebo-linux.id
  vpc = true
  }

resource "aws_vpc" "nebo_vpc" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "nebo VPC"
  }
}

resource "aws_subnet" "public_subnet" {
  vpc_id            = aws_vpc.nebo_vpc.id
  cidr_block        = "10.0.1.0/24"
  availability_zone = "us-west-2a"
  map_public_ip_on_launch = true

  tags = {
    Name = "Public Subnet"
  }
}

resource "aws_route_table" "nebo_publicroute" {
  vpc_id = aws_vpc.nebo_vpc.id

  route {
    cidr_block = "0.0.0.0/32"
    gateway_id = aws_internet_gateway.nebo_gate.id
  }

}

resource "aws_internet_gateway" "nebo_gate" {
  vpc_id = aws_vpc.nebo_vpc.id
}

resource "aws_route_table_association" "route_subnet" {
  subnet_id      = aws_subnet.public_subnet.id
  route_table_id = aws_route_table.nebo_publicroute.id
}
resource "aws_route_table_association" "route_gate" {
  gateway_id     = aws_internet_gateway.nebo_gate.id
  route_table_id = aws_route_table.nebo_publicroute.id
}
