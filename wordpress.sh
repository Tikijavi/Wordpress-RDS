#!/bin/bash
sudo apt update
sudo apt install apache2 php libapache2-mod-php php-mysql -y
sudo apt install php-curl php-gd php-mbstring php-xml php-xmlrpc php-soap php-intl php-zip -y
sudo systemctl restart apache2
curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
chmod +x wp-cli.phar
sudo mv wp-cli.phar /usr/local/bin/wp
cd /var/www/html/
sudo wp core download --allow-root
sudo wp core config --dbhost=${rdshost} --dbname=javieselmillor --dbuser=javier --dbpass=1q2w3e4R --allow-root
sudo chmod 644 wp-config.php
sudo wp core install --url=yourwebsite.com --title="Your Blog Title" --admin_name=wordpress_admin --admin_password=4Long&Strong1 --admin_email=you@example.com --allow-root
sudo systemctl restart apache2

