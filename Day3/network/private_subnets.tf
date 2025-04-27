resource "aws_subnet" "private" {
  for_each = var.private_subnets

  vpc_id            = aws_vpc.main.id
  cidr_block        = each.value
  availability_zone = element(var.availability_zones, index(keys(var.private_subnets), each.key))

  tags = {
    Name = "${var.name_prefix}-${each.key}"
  }
}