variable "aws_ami_id" {
    description = "The AMI ID to use for the EC2 instance"
    type        = string
    default     = "ami-087d1c9a513324697"
  
}
variable "instance_type" {
    description = "The type of instance to use"
    type        = string
    default     = "t3.micro"
  
}
variable "key_name" {
    description = "The name of the key pair to use for SSH access"
    type        = string
    default     = "gitlab-runner"
  
}
variable "env" {
    description = "The environment for the resources"
    type        = string
    default     = "dev"
  
}