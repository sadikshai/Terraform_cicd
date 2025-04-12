data "aws_ami" "ubuntu" {
    most_recent = true
    filter {
      name="name"
      values=[var.ami_value]

    }
    owners = [var.ami_owner ]
  
}


resource "aws_instance" "bastion" {
  key_name                    = var.instance_key_name
  ami                         = data.aws_ami.ubuntu.id
  vpc_security_group_ids      = [var.security_bn] # <- FIXED
  subnet_id                   = var.subnet_id
  associate_public_ip_address = true
  instance_type               = var.instance_type
  tags = {
    Name = var.instance_name
  }
}
