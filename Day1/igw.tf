resource "aws_internet_gateway" "lab1-gw" {
  vpc_id = aws_vpc.lab1-vpc.id

  tags = {
    Name = "terraform-lab1-gw"
  }
}