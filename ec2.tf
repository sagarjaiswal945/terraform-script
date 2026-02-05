resource "aws_key_pair" "my_key" {
    key_name   = "gitcred"
    public_key = file("${path.module}/gitcred.pub")
}
resource "aws_security_group" "public_sg" {
    name        = "${var.Name}-public-sg"
    description = "Security group for public instances"
    vpc_id      = aws_vpc.main.id

    ingress {
        from_port   = 22
        to_port     = 22
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
    ingress {
        from_port   = 80
        to_port     = 80
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
    ingress {
        from_port   = 443
        to_port     = 443
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
    egress {
        from_port   = 0
        to_port     = 0
        protocol    = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }
  
}

resource "aws_security_group" "private_sg" {
    name        = "${var.Name}-private-sg"
    description = "Security group for private instances"
    vpc_id      = aws_vpc.main.id
    egress {
        from_port   = 0
        to_port     = 0
        protocol    = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }
  
}
resource "aws_security_group_rule" "private_to_public" {
    type                     = "ingress"
    from_port                = 0
    to_port                  = 0
    protocol                 = "-1"
    security_group_id        = aws_security_group.private_sg.id
    source_security_group_id = aws_security_group.public_sg.id
}

resource "aws_instance" "public_instance" {
    ami = var.ami_id
    instance_type = var.instance_type
    subnet_id = aws_subnet.public_subnet.id
    security_groups = [aws_security_group.public_sg.id]
    key_name = aws_key_pair.my_key.key_name
    tags = {
        Name = "${var.Name}-public-instance"
        Environment = var.Environment
    }
}
resource "aws_instance" "private_instance" {
    ami = var.ami_id
    instance_type = var.instance_type
    subnet_id = aws_subnet.private_subnet.id
    security_groups = [aws_security_group.private_sg.id]
    key_name = aws_key_pair.my_key.key_name
    tags = {
        Name = "${var.Name}-private-instance"
        Environment = var.Environment
    }
}