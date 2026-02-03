data "aws_vpc" "default" {
  default = true
}

resource "aws_key_pair" "my_key" {
  key_name   = var.key_name
  public_key = file("${path.module}/${var.key_name}.pub")
  
}
resource "aws_security_group" "mysg" {
    name        = "allow_ssh_http_${var.env}"
    description = "Allow SSH and HTTP inbound traffic"
    vpc_id      = data.aws_vpc.default.id
    
    ingress {
        description = "SSH"
        from_port   = 22
        to_port     = 22
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    ingress {
        description = "HTTP"
        from_port   = 80
        to_port     = 80
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    ingress {
        description = "Custom Port 8000"
        from_port   = 8000
        to_port     = 8000
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
    ingress {
        description = "HTTPS"
        from_port   = 443
        to_port     = 443
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
    egress {
        description = "All outbound traffic"
        from_port   = 0
        to_port     = 0
        protocol    = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }  
}

resource "aws_instance" "runner_gitlab" {
    ami                    = var.aws_ami_id
    instance_type          = var.instance_type
    key_name               = aws_key_pair.my_key.key_name
    associate_public_ip_address = true
    vpc_security_group_ids = [aws_security_group.mysg.id]
    tags = {
        Name = "gitlab-runner-${var.env}"
    }
  
}