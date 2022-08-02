data "aws_ami" "amzn2" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "architecture"
    values = ["x86_64"]
  }

  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  filter {
    name   = "name"
    values = ["amzn2-ami-kernel-5.10-hvm-2.0.*-x86_64-gp2"]
  }
}

resource "aws_instance" "my_amzn2" {
  count         = var.instance_count
  ami           = data.aws_ami.amzn2.id
  instance_type = var.instance_type
  key_name      = var.key_name

  vpc_security_group_ids = [aws_security_group.allow_ssh.id]

  user_data = <<EOF
    #!/bin/bash
    sudo yum update && sudo yum upgrade
    sudo wget -O screenfetch https://git.io/vaHfR
    sudo chmod +x screenfetch
    sudo mv screenfetch /usr/local/bin
    echo 'Hello world!' > /tmp/hello.txt
  EOF

  tags = local.default_tags
}
