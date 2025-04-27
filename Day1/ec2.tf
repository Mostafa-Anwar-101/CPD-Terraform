resource "aws_instance" "Bastion" {
  ami                         = "ami-084568db4383264d4"
  instance_type               = "t2.micro"
  subnet_id                   = aws_subnet.pub-sub1.id
  vpc_security_group_ids      = [aws_security_group.bastion_sg.id]
  associate_public_ip_address = true
  key_name                    = "TF-key"
  tags = {
    Name = "Bastion"
  }
}

resource "aws_instance" "Private" {
  ami                         = "ami-084568db4383264d4"
  instance_type               = "t2.micro"
  subnet_id                   = aws_subnet.private-sub1.id
  vpc_security_group_ids      = [aws_security_group.app_sg.id]
  associate_public_ip_address = false
  key_name                    = "TF-key"
  tags = {
    Name = "Application"
  }
}