resource "aws_launch_configuration" "launch_configuration" {
  name          = var.launch_configuration_name
  image_id      = var.image_id
  instance_type = var.instance_type

  security_groups = [aws_security_group.security_group_ec2.id]
  associate_public_ip_address = true

  lifecycle { create_before_destroy = true }
}

#TODO: Inbound Traffic Config to Service
