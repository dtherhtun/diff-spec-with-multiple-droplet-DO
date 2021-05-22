#!/bin/bash
apt-get update
apt-get -y install apache2 mysql-server php libapache2-mod-php php-mysql php-cli
sudo adduser tony --gecos "First Last,RoomNumber,WorkPhone,HomePhone" --disabled-password
echo "tony ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers
usermod -aG sudo tony
mkdir -p /home/tony/.ssh
cp /root/.ssh/authorized_keys /home/tony/.ssh/authorized_keys
chown -R tony:tony /home/tony/.ssh
chmod -R 700 /home/tony/.ssh
ufw allow in "Apache Full"
sed -i 's/PermitRootLogin yes/PermitRootLogin no/g' /etc/ssh/sshd_config
sed -i 's/upload_max_filesize = 2M/upload_max_filesize = 100M/g' /etc/php/7.2/apache2/php.ini
sed -i '2s/$/ index.php/' /etc/apache2/mods-enabled/dir.conf
mkdir -p /var/www/tonyexample.com/public_html
cat << EOF > /var/www/tonyexample.com/public_html/index.php
<html>
  <head>
    <title>Welcome to Tony Example.com!</title>
  </head>
  <body>
    <h1>Success! The tonyexample.com virtual host is working!</h1>
    <?php
phpinfo();
?>
  </body>
</html>
EOF
chown -R tony:www-data /var/www/tonyexample.com/public_html
chmod -R 755 /var/www/
cat << EOF > /etc/apache2/sites-available/tonyexample.com.conf
<VirtualHost *:80>
    ServerAdmin admin@tonyexample.com
    ServerName tonyexample.com
    ServerAlias www.tonyexample.com
    DocumentRoot /var/www/tonyexample.com/public_html
    ErrorLog /var/log/apache2/error.log
    CustomLog /var/log/apache2/access.log combined
</VirtualHost>
EOF
a2ensite tonyexample.com.conf
a2ensite default-ssl.conf
a2dissite 000-default.conf
systemctl reload apache2
systemctl restart apache2 sshd 
systemctl enable apache2

