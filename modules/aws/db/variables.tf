variable "db_name" {
  default = "kpmg-db"
}
variable "tags" {
  type = map(string)
}


variable "db_engine" {
}

variable "db_engine_version" {
  default = ""
}

variable "db_instance_class" {
}

variable "db_instance_count" {
}

variable "master_username" {
}

variable "master_password" {
}

variable "availability_zones" {
  type = list(string)
}

variable "deletion_protection" {
  default = false
}