variable "ami_name" {
  type        = string
  description = "(optional) AMI name to use for the instance"
  default     = "ami-06aa3f7caf3a30282"
}

variable "instance_type" {
  type        = string
  description = "(optional) Instance type to use for the instance"
  default     = "t2.micro"
}

variable "instance_name" {
  type        = string
  description = "(optional) Instance name to use for the instance"
  default     = "my-server"
}

variable "ec2_security_group_name" {
  description = "The Name of the EC2 Security Group"
  type        = string
  default     = "Free Tier EC2 Security Group"
}

variable "ec2_key" {
  description = "The Name of the EC2 Key Pair"
  type        = string
  default     = "my-server-key"
}

variable "is_tmplt_req" {
  description = "Is template required"
  type        = bool
  default     = true
}
