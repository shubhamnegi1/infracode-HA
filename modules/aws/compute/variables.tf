variable "tags" {
  type = map(string)
}

variable "ha" {
  default = "yes"
}

variable "name" {
}

variable "ami_id" {
}

variable "instance_type" {
}

variable "cpu_credit_specification" {
  default = "standard"
}

variable "target_subnets" {
  type = list(string)
}

variable "iam_instance_profile" {
  description = "Provide an instance profile name to pass an IAM role to an EC2 instance"
}

variable "security_group_ids" {
  type    = list(string)
  default = []
}

variable "associate_public_ip_address" {
  default = false
}

variable "ssh_key_pair_name" {
  default = ""
}

variable "ec2_user_data" {
  default = ""
}

variable "enable_detailed_monitoring" {
  default = false
}

variable "ebs_optimized" {
  default = false
}

variable "ebs_root_volume_device_name" {
}

variable "ebs_root_volume_size_gigabytes" {
    default = "8"
}

variable "ebs_root_volume_type" {
  default = "gp2"
}

variable "private_ip" {
  type = string 
  default =""
  description = "The primary private IPv4 address, works only when HA is not yes."
}

