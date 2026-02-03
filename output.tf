output "ec2_public_ip" {
    value = aws_instance.runner_gitlab.public_ip
  
}