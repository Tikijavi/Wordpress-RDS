# Claus de la instancia
resource "aws_key_pair" "keypair" {
    key_name    = var.key_pair
    #public_key  = "mykey.pub"
    public_key  = "${file("mykey.pub")}"
}

# Instància EC2 amb la instal·lació del wordpress
resource "aws_instance" "Wordpress" {
  depends_on = [aws_internet_gateway.public_internet_gw]
  ami           = var.ami_ec2
  instance_type = var.instance_type_ec2
  key_name      = aws_key_pair.keypair.key_name
  subnet_id = aws_subnet.public_subnet.id
  vpc_security_group_ids = [aws_security_group.SG_public_subnet.id]
  tags = {
     Name = "Wordpress"
  }

   user_data = templatefile("wordpress.sh", {
    rdshost = "${aws_db_instance.DataBase.endpoint}"
  })



 provisioner "local-exec" {
  command = "echo ${aws_instance.Wordpress.public_ip} > publicIP.txt"
 }
}

# Llençant la base de dades RDS
resource "aws_db_instance" "DataBase" {
  allocated_storage    = 20

#  max_allocated_storage = 100
  storage_type         = var.storage_type_db
  engine               = var.engine_type_db
  engine_version       = var.engine_version_db
  instance_class       = var.instance_type_db
  name                 = var.name_db
  username             = var.username_db
  password             = var.password_db
  parameter_group_name = var.group_db
  publicly_accessible = false
  db_subnet_group_name = aws_db_subnet_group.db_subnet.name
  vpc_security_group_ids = [aws_security_group.SG_private_subnet_.id]
  skip_final_snapshot = true

provisioner "local-exec" {
  command = "echo ${aws_db_instance.DataBase.endpoint} > DB_host.txt"
    }
}

#AWS cloudwatch logs
resource "aws_cloudwatch_log_group" "log_group" {
  name              = var.logs_path
  retention_in_days = var.log_group_retention_in_days
  kms_key_id        = var.log_group_kms_key_id
  tags              = var.tags
}

resource "aws_cloudwatch_log_stream" "log_stream" {
  name           = var.logs_path
  log_group_name = aws_cloudwatch_log_group.log_group.name
}


