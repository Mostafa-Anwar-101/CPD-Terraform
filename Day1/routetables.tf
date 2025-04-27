resource "aws_route_table" "public-rt" {
  vpc_id = aws_vpc.lab1-vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.lab1-gw.id
  }

  tags = {
    Name = "public-rt"
  }
}

resource "aws_route_table_association" "public1-association" {
  subnet_id      = aws_subnet.pub-sub1.id
  route_table_id = aws_route_table.public-rt.id
}

resource "aws_route_table_association" "public2-association" {
  subnet_id      = aws_subnet.pub-sub2.id
  route_table_id = aws_route_table.public-rt.id
}

resource "aws_route_table" "private-rt" {
  vpc_id = aws_vpc.lab1-vpc.id

  tags = {
    Name = "private-rt"
  }
}

resource "aws_route_table_association" "private1-association" {
  subnet_id      = aws_subnet.private-sub1.id
  route_table_id = aws_route_table.private-rt.id
}

resource "aws_route_table_association" "private2-association" {
  subnet_id      = aws_subnet.private-sub2.id
  route_table_id = aws_route_table.private-rt.id
}