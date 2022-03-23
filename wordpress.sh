#!/bin/bash
sudo apt update
sudo apt install apache2 php libapache2-mod-php php-mysql -y
sudo apt install php-curl php-gd php-mbstring php-xml php-xmlrpc php-soap php-intl php-zip -y
sudo systemctl restart apache2
sudo wget https://wordpress.org/wordpress-5.1.1.tar.gz
sudo tar xzvf wordpress-5.1.1.tar.gz
sudo touch /wordpress/.htaccess
sudo rm /var/www/html/index.html
sudo cp -r wordpress/* /var/www/html/
sudo rm -rf wordpress
sudo rm -rf wordpress-5.1.1.tar.gz
sudo chown -R www-data:www-data /var/www/html
sudo wget https://raw.githubusercontent.com/Tikijavi/Wordpress-RDS/master/wp-config.php
sudo mv wp-config.php /var/www/html/wp-config.php
sudo sed -i "32 i define( 'DB_HOST', '${rdshost}');" /var/www/html/wp-config.php 
sudo systemctl restart apache2
curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
chmod +x wp-cli.phar
sudo mv wp-cli.phar /usr/local/bin/wp
