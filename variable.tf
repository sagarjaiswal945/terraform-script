variable "Name" {
    description = "Name tag for resources"
    type        = string
    default = "tws-sagar"
  
}
variable "Environment" {
  description = "The environment name"
  type        = string
    default = "dev"
}
variable "vpc_cidr_block" {
    description = "The CIDR block for the VPC"
    type        = string
    default = "10.0.0.0/16"

}
variable "public_subnet_cidr" {
    description = "The CIDR block for the public subnet"
    type        = string
    default = "10.0.1.0/24"
}
variable "private_subnet_cidr" {
    description = "The CIDR block for the private subnet"
    type        = string
    default = "10.0.2.0/24"
}

variable "availability_zone" {
  description = "Availability Zone"
  type        = string
  default     = "ap-south-1a"
}

variable "ami_id" {
    description = "The AMI ID for the EC2 instance"
    type        = string
    default     = "ami-019715e0d74f695be" # Amazon Ubuntu AMI (HVM), SSD Volume Type
  
}
variable "instance_type" {
    description = "The instance type for the EC2 instance"
    type        = string
    default     = "t3.micro"
}