data "aws_ami" "amazon_linux" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-gp2"]
  }
}

resource "aws_instance" "bastion" {
  ami                    = data.aws_ami.amazon_linux.id
  instance_type          = var.instance_type
  subnet_id              = values(aws_subnet.public)[0].id
  vpc_security_group_ids = [aws_security_group.bastion.id]
  key_name               = "TF-key"

  tags = {
    Name        = "${var.environment}-bastion"
    Environment = var.environment
  }

  provisioner "local-exec" {
    command = "echo 'Bastion Public IP: ${self.public_ip}'"
  }
}
