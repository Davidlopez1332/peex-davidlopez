resource "aws_vpc" "nebo-vpc" {
  cidr_block = "10.0.0.0/16"
}

resource "aws_subnet" "nebo-private" {
  vpc_id            = aws_vpc.nebo-vpc.id
  cidr_block        = "10.0.1.0/24"
  map_public_ip_on_launch = false
  availability_zone = "us-west-2a"
}


resource "aws_route_table" "nebo_route" {
  vpc_id = aws_vpc.nebo-vpc.id

  route {
    cidr_block = "0.0.0.0/0"
  }

}

resource "aws_route_table_association" "route_subnet" {
  subnet_id      = aws_subnet.nebo-private.id
  route_table_id = aws_route_table.nebo_route.id
}
