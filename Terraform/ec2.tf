resource "aws_key_pair" "my_key_pair" {
  key_name   = "${var.name}-key-pair"
  public_key = file("${path.module}/jenkinskey.pub")
  tags = {
    Name        = "${var.name}-key-pair"
    Environment = var.environment
  }

}

resource "aws_security_group" "mysg" {
  name        = "${var.name}-sg"
  description = "Security group for ${var.name} resources"
  vpc_id      = aws_vpc.my_vpc.id
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
  ingress {
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 5000
    to_port     = 5000
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name        = "${var.name}-sg"
    Environment = var.environment
  }

}
resource "aws_instance" "my_instance" {
  ami                    = var.ami_id
  instance_type          = var.instance_type
  subnet_id              = aws_subnet.public_subnet.id
  key_name               = aws_key_pair.my_key_pair.key_name
  vpc_security_group_ids = [aws_security_group.mysg.id]
  associate_public_ip_address = true
  tags = {
    Name        = "${var.name}-instance"
    Environment = var.environment
  }

}