resource "aws_instance" "ec2_instance" {
  ami           = var.ami_name
  instance_type = var.instance_type

  associate_public_ip_address = true

  key_name = var.ec2_key

  security_groups = [aws_security_group.ec2_security_group.name]

  user_data = var.is_tmplt_req ? templatefile("./aws-ec2-instance/user_data.sh.tmpl", {
    instance_name = var.instance_name
  }) : ""

  tags = {
    Name = var.instance_name
  }
}
