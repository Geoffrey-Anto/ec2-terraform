output "ec2_ip" {
  description = "The public IP of the EC2 instance"
  value       = aws_instance.ec2_instance.public_ip
}

output "ec2_dns" {
  description = "The public DNS of the EC2 instance"
  value       = aws_instance.ec2_instance.public_dns
}

output "ec2_endpoint_output" {
  description = "The public DNS of the EC2 instance"
  value       = var.instance_preset == "ansible" ? "http://${aws_instance.ec2_instance.public_ip}" : var.instance_preset == "jenkins" ? "http://${aws_instance.ec2_instance.public_ip}:8080" : "http://${aws_instance.ec2_instance.public_ip}"
}
