variable "security_group_name" {
  type = string
  description = "Name of the security group."
}

variable "security_group_description" {
  type = string
  description = "Security group description."
}

variable "vpc_id" {
  type = string
  description = "VPC ID. Defaults to the region's default VPC."
}