#!/bin/bash
echo "UPDATING SYSTEM"
dnf update -y
echo "INSTALLING APACHE SEVER"
dnf install httpd -y
echo "APACHE SEVER INSTALLED"
#echo "OPENING PORT 80"
#firewall-cmd --add-port=80/tcp --permanent
echo "RESTARTING APACHE SEVER"
systemctl start httpd
echo "ENABLING APACHE SEVER"
systemctl enable httpd

echo "INSTALLING PHP"
dnf install php -y
echo "CREATING PHP TEST PAGE AT localhost/info.php"
touch /var/www/html/info.php
echo "<?php phpinfo(); ?>" >> /var/www/html/info.php

echo "RESTARTING APACHE SEVER"
systemctl restart httpd

echo "INSTALLING MARIA DB SERVER"
dnf install mariadb mariadb-server -y
echo "STARTING MARIA DB SERVER"
systemctl start mariadb
echo "ENABLING MARIA DB SERVER"
systemctl enable mariadb
echo "SECURING MARIA DB SERVER"
mysql_secure_installation

echo "INSTALLING PHP MY ADMIN"
dnf install phpmyadmin -y
echo "RESTARTING APACHE SEVER"
systemctl restart httpd
echo "LAMP SETUP COMPLETE"
