output "aws_vpc" {
  value = aws_vpc.main.id
  
}
output "public_subnet" {
  value = aws_subnet.public_subnet.id
}
output "private_subnet" {
  value = aws_subnet.private_subnet.id
}
output "internet_gateway" {
  value = aws_internet_gateway.igw.id
}
output "public_route_table" {
  value = aws_route_table.public_rt.id
}
output "private_route_table" {
  value = aws_route_table.private_rt.id
}
output "public_route_table_association" {
  value = aws_route_table_association.public_rt_assoc.id
}
output "private_route_table_association" {
  value = aws_route_table_association.private_rt_assoc.id
}
output "public_security_group" {
  value = aws_security_group.public_sg.id
}
output "private_security_group" {
  value = aws_security_group.private_sg.id
}
output "ec2_public_instance" {
  value = aws_instance.public_instance.id
}
output "ec2_private_instance" {
  value = aws_instance.private_instance.id
}
output "ec2_public_instance_ip" {
    value = aws_instance.public_instance.public_ip
  
}
output "ec2_private_instance_ip" {
    value = aws_instance.private_instance.private_ip
}
