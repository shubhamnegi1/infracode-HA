resource "aws_launch_template" "launch_template" {
  count = var.ha=="yes"?1:0
  name          = "Launch-template-${var.name}"
  image_id      = var.ami_id
  ebs_optimized = var.ebs_optimized
  instance_type = var.instance_type
  key_name      = var.ssh_key_pair_name
  tags          = var.tags
  user_data     = var.ec2_user_data

  block_device_mappings {
    device_name = var.ebs_root_volume_device_name
    ebs {
      volume_size = var.ebs_root_volume_size_gigabytes
      volume_type = var.ebs_root_volume_type
      encrypted = true
    }
  }

  iam_instance_profile {
    name = var.iam_instance_profile
  }

  network_interfaces {
    associate_public_ip_address = var.associate_public_ip_address
    delete_on_termination       = true
    security_groups             = var.security_group_ids
  }
}