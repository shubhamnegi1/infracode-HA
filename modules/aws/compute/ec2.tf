resource "aws_instance" "instance" {
  count = var.ha=="yes"?0:1
  tags = var.tags
  ami      = var.ami_id
  ebs_optimized = var.ebs_optimized
  instance_type = var.instance_type
  key_name      = var.ssh_key_pair_name
  user_data_base64     = var.ec2_user_data
  iam_instance_profile = var.iam_instance_profile
  ebs_block_device  {
      device_name = var.ebs_root_volume_device_name
      volume_size = var.ebs_root_volume_size_gigabytes
      volume_type = var.ebs_root_volume_type
      encrypted = true
  }

  root_block_device {
    encrypted             = true
  }

  associate_public_ip_address = var.associate_public_ip_address
  vpc_security_group_ids             = var.security_group_ids
  private_ip= var.private_ip
  subnet_id= var.target_subnets[0]
}