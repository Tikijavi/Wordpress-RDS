# Crea una nova VPC
resource "aws_vpc" "my_vpc" {
  cidr_block    = "192.168.0.0/16"
  enable_dns_hostnames = true

  tags = {
        Name = "my_vpc"
  }
}

# Crea una subnet pública per al wordpress
resource "aws_subnet" "public_subnet" {
  vpc_id        = aws_vpc.my_vpc.id
  cidr_block = "192.168.5.0/24"
  map_public_ip_on_launch = true

  tags = {
        Name = "public_subnet"
  }
}

# Crea una subnet privada per a la base de dades
resource "aws_subnet" "private_subnet" {
  vpc_id        = aws_vpc.my_vpc.id
  cidr_block = "192.168.6.0/24"

  tags = {
        Name = "private_subnet"
  }
}

# Crea un grup de subxarxes de base de dades per a RDS sota el nostre VPC
resource "aws_db_subnet_group" "db_subnet" {
  name          = "rds_db"
  subnet_ids = [aws_subnet.private_subnet.id, aws_subnet.public_subnet.id ]

  tags = {
        Name = "My DB subnet group"
  }
}
