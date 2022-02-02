# Crear VPC
resource "aws_vpc" "my_vpc" {
  cidr_block       = "192.168.0.0/16"
  enable_dns_hostnames = true
 
  tags = {
    Name = "my_vpc"
  }
}

# Subnet pública per a wordpress
resource "aws_subnet" "public_subnet" {
  vpc_id     = aws_vpc.my_vpc.id
  cidr_block = "192.168.5.0/24"
  map_public_ip_on_launch = true

  tags = {
    Name = "subnet_publica"
  }
}

# Subnet privada per a la DB
resource "aws_subnet" "private_subnet" {
  vpc_id     = aws_vpc.my_vpc.id
  cidr_block = "192.168.6.0/24"
 
  tags = {
    Name = "subnet_privada"
  }
}

# Grup subnet de la DB 
resource "aws_db_subnet_group" "db_subnet" {
  name       = "rds_db"
  subnet_ids = [aws_subnet.private_subnet.id, aws_subnet.public_subnet.id ]

  tags = {
    Name = "El nostre grup per a la subnet de la DB"
  }
}
