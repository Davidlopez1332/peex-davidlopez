
resource "aws_vpc" "nebo-vpc" {
  cidr_block = "10.0.0.0/16"
}


resource "aws_subnet" "snet_public" {
  vpc_id            = aws_vpc.nebo-vpc.id
  cidr_block        = "10.0.1.0/24"
  availability_zone = "us-west-2a"
  map_public_ip_on_launch = true
}

resource "aws_route_table" "nebo_publicroute" {
  vpc_id = aws_vpc.nebo-vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.nebo_gate.id
  }

}

resource "aws_internet_gateway" "nebo_gate" {
  vpc_id = aws_vpc.nebo-vpc.id
}

resource "aws_route_table_association" "route_subnet" {
  subnet_id      = aws_subnet.snet_public.id
  route_table_id = aws_route_table.nebo_publicroute.id
}
resource "aws_route_table_association" "route_gate" {
  gateway_id     = aws_internet_gateway.nebo_gate.id
  route_table_id = aws_route_table.nebo_publicroute.id
}