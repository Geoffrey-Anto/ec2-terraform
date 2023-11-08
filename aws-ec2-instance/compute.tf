resource "aws_instance" "ec2_instance" {
  ami           = var.ami_name
  instance_type = var.instance_type

  associate_public_ip_address = true

  key_name = var.ec2_key

  security_groups = [aws_security_group.ec2_security_group.name]

  user_data = <<-EOF
              #!/bin/bash
              echo "Hello, World 1" > index.html
              python3 -m http.server 8080 &
              EOF

  tags = {
    Name = var.instance_name
  }
}
