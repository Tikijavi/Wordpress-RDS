# Generar un par de claus
resource "tls_private_key" "my_key" {
  algorithm = "RSA"
}

# Generar claus amb la clau anterior
resource "aws_key_pair" "deployer" {
  key_name   = "wordpress-key"
  public_key = tls_private_key.my_key.public_key_openssh
}

# Guardar par de claus
resource "null_resource" "save_key_pair"  {
    provisioner "local-exec" {
        command = "echo  ${tls_private_key.my_key.private_key_pem} > mykey.pem"
      }
}
