# Creació d'un grup de seguretat nou per a una subxarxa pública
resource "aws_security_group" "SG_public_subnet" {
  name        = "Grup_seguretat_WordPress"
  description = "Permet SSH i HTTP per a WordPress"
  vpc_id      =  aws_vpc.my_vpc.id                   

  ingress {
    description = "SSH desde VPC"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

 ingress {
    description = "HTTP desde VPC"
    from_port   = 80
    to_port     = 80
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

# Creació d'un grup de seguretat nou per a una subxarxa privada
resource "aws_security_group" "SG_private_subnet_" {
  name        = "Grup_seguretat_MYSQL"
  description = "MYSQL"
  vpc_id      =  aws_vpc.my_vpc.id                   

  ingress {
    description = "Port MYSQL"
    from_port   = 3306
    to_port     = 3306
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
