resource "aws_instance" "public_server" {

  ami           = data.aws_ami.ubuntu.id
  instance_type = var.instance_type
  key_name      = data.aws_key_pair.this.key_name

  subnet_id                   = var.public_subnet_id
  associate_public_ip_address = true

  security_groups = [var.bastian_host_sg_id]

  tags = {
    Terraform = true
  }
}
