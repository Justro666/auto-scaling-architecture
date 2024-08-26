resource "aws_launch_template" "this" {
  name                   = var.launch_template_name
  image_id               = var.ami_id
  instance_type          = var.instance_type
  vpc_security_group_ids = [var.app_sg_id]
  update_default_version = true
  key_name               = data.aws_key_pair.this.key_name

  block_device_mappings {
    device_name = "/dev/sdf"

    ebs {
      volume_size = 8
    }
  }

  tags = {
    Terraform = true
  }

  user_data = var.user_data
}
