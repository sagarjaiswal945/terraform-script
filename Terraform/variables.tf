variable "name" {
    description = "Name of the resource"
    type        = string
    default = "tws-sagar"
  
}
variable "environment" {
    description = "Environment for the resource"
    type        = string
    default = "dev"
}
variable "instance_type" {
    description = "Type of the instance"
    type        = string
    default = "c7i-flex.large"
  
}
variable "ami_id" {
    description = "AMI ID for the instance"
    type        = string
    default = "ami-05d2d839d4f73aafb"
  
}
variable "VPC_cidr" {
    description = "CIDR block for the VPC"
    type        = string
    default = "10.0.0.0/16"
}
variable "public_subnet_cidr" {
    description = "CIDR block for the public subnet"
    type        = string
    default = "10.0.1.0/24"
}