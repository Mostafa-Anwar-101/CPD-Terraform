resource "aws_subnet" "public" {
  for_each = var.public_subnets

  vpc_id                  = aws_vpc.main.id
  cidr_block              = each.value
  availability_zone       = element(var.availability_zones, index(keys(var.public_subnets), each.key))
  map_public_ip_on_launch = true

  tags = {
    Name = "${var.name_prefix}-${each.key}"
  }
}