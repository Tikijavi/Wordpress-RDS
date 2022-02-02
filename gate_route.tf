# Creació del gateway de cara al públic
resource "aws_internet_gateway" "public_internet_gw" {
  vpc_id =  aws_vpc.my_vpc.id

  tags = {
    Name = "gateway_per_a_internet"
  }
}

# Permet que la taula de rutes predeterminada vagi al gateway 
resource "aws_default_route_table" "gw_router" {
  default_route_table_id = aws_vpc.my_vpc.default_route_table_id

  route {
      cidr_block = "0.0.0.0/0"
      gateway_id = aws_internet_gateway.public_internet_gw.id
    }

  tags = {
    Name = "tabla predeterminada"
  }
}

# Associar subxarxa pública
resource "aws_route_table_association" "associate_subnet" {
  subnet_id      = aws_subnet.public_subnet.id
  route_table_id = aws_default_route_table.gw_router.id
}
