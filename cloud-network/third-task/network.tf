
resource "aws_vpc" "vnet-nebo" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "vnet-nebo"
  }
}

resource "aws_subnet" "snet-public" {
  vpc_id = aws_vpc.vnet-nebo.id
  cidr_block = "10.0.0.0/17"
  map_public_ip_on_launch = true
  availability_zone = "us-east-1a"
  tags = {
    Name = "snet-public"
  }
}

resource "aws_subnet" "snet-private" {
  vpc_id = aws_vpc.vnet-nebo.id
  cidr_block = "10.0.128.0/17"
  map_public_ip_on_launch = false
  availability_zone = "us-east-1b"
  tags = {
    Name = "snet-private"
  }
}

resource "aws_route_table" "nebo_publicroute" {
  vpc_id = aws_vpc.vnet-nebo.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.nebo_gate.id
  }

}

resource "aws_internet_gateway" "nebo_gate" {
  vpc_id = aws_vpc.vnet-nebo.id
}

resource "aws_route_table_association" "route_subnet" {
  subnet_id      = aws_subnet.snet-public.id
  route_table_id = aws_route_table.nebo_publicroute.id
}
resource "aws_route_table_association" "route_gate" {
  gateway_id     = aws_internet_gateway.nebo_gate.id
  route_table_id = aws_route_table.nebo_publicroute.id
}