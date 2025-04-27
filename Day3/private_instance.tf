resource "aws_instance" "private" {
  ami                    = data.aws_ami.amazon_linux.id
  instance_type          = "t2.micro"
  subnet_id              = module.lab-3-network.private_subnet_ids[0]
  vpc_security_group_ids = [aws_security_group.private_instance.id]

  tags = {
    Name = "private-instance"
  }
}