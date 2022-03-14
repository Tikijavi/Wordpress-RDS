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

  user_data = <<EOF
         #!/bin/bash
             sudo yum install httpd php php-mysql -y -q
             sudo cd /var/www/html
             echo "Welcome" > hi.html
             sudo wget https://wordpress.org/wordpress-5.1.1.tar.gz
             sudo tar -xzf wordpress-5.1.1.tar.gz
             sudo cp -r wordpress/* /var/www/html/
             sudo rm -rf wordpress
             sudo rm -rf wordpress-5.1.1.tar.gz
             sudo chmod -R 755 wp-content
             sudo chown -R apache:apache wp-content
             sudo wget https://s3.amazonaws.com/bucketforwordpresslab-donotdelete/htaccess.txt
             sudo mv htaccess.txt .htaccess
             sudo systemctl start httpd
             sudo systemctl enable httpd
             sudo wget https://raw.githubusercontent.com/Tikijavi/Wordpress-RDS/master/wp-config.php
             sudo mv wp-config.php /var/www/html/wp-config.php
             sudo sed -i "32 i define( 'DB_HOST', '${aws_db_instance.DataBase.endpoint}');" /var/www/html/wp-config.php 
             sudo systemctl restart httpd
      EOF


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
#S3
resource "aws_s3_bucket" "b" {
  bucket = var.bucket

  tags = {
    Name        = var.bucket_name
    Environment = var.bucket_env
  }
}

#Backups
sudo mysqldump -u javier -p 1q2w3e4R --all-databases | gzip > mysqldb_`date +%F`.sql.gz
sudo crontab -e
30 23 * * * backup.sh


