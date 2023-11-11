output "ec2_1_ip" {
  description = "The public IP of the EC2 instance"
  value       = module.aws-ec2-instance-1.ec2_ip
}

output "ec2_1_dns" {
  description = "The public DNS of the EC2 instance"
  value       = module.aws-ec2-instance-1.ec2_dns
}

output "ec2_2_ip" {
  description = "The public IP of the EC2 instance"
  value       = module.aws-ec2-instance-2.ec2_ip
}

output "ec2_2_dns" {
  description = "The public DNS of the EC2 instance"
  value       = module.aws-ec2-instance-2.ec2_dns
}

variable "instanceName" {
  description = "The name of the EC2 instance"
  type        = string
}

variable "instancePreset" {
  description = "The name of preset: (default, ansible, jenkins)"
  type        = string
}

locals {
  environment = terraform.workspace
}

module "aws-ec2-instance-1" {
  source                  = "./aws-ec2-instance"
  ami_name                = "ami-06aa3f7caf3a30282" # Ubuntu 20.04 LTS
  instance_type           = "t2.micro"
  instance_name           = "${var.instanceName}-${local.environment}-1"
  ec2_security_group_name = "http-https-ssh-sg"
  ec2_key                 = local.environment == "prod" ? "ssh-key-prod" : "ssh-key-dev"
  instance_preset         = var.instancePreset
}


module "aws-ec2-instance-2" {
  source                  = "./aws-ec2-instance"
  ami_name                = "ami-06aa3f7caf3a30282" # Ubuntu 20.04 LTS
  instance_type           = "t2.micro"
  instance_name           = "${var.instanceName}-${local.environment}-2"
  ec2_security_group_name = "http-https-ssh-sg"
  ec2_key                 = local.environment == "prod" ? "ssh-key-prod" : "ssh-key-dev"
  instance_preset         = var.instancePreset
}
