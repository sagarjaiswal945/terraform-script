resource "aws_vpc" "my_vpc" {
  cidr_block = var.VPC_cidr
  tags = {
    Name        = "${var.name}-vpc"
    Environment = var.environment
  }

}
resource "aws_subnet" "public_subnet" {
  vpc_id            = aws_vpc.my_vpc.id
  cidr_block        = var.public_subnet_cidr
  availability_zone = "ap-south-1a"
  map_public_ip_on_launch = true
  tags = {
    Name        = "${var.name}-public-subnet"
    Environment = var.environment
  }

}
resource "aws_internet_gateway" "my_igw" {
  vpc_id = aws_vpc.my_vpc.id
  tags = {
    Name        = "${var.name}-igw"
    Environment = var.environment
  }

}
resource "aws_route_table" "public_rt" {
  vpc_id = aws_vpc.my_vpc.id
  tags = {
    Name        = "${var.name}-public-rt"
    Environment = var.environment
  }

}
resource "aws_route" "default_route" {
  route_table_id         = aws_route_table.public_rt.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.my_igw.id
}
resource "aws_route_table_association" "public_assoc" {
  subnet_id      = aws_subnet.public_subnet.id
  route_table_id = aws_route_table.public_rt.id
}