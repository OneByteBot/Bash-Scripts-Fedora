#!/bin/bash

echo "UPDATING SYSTEM"
dnf update -y

echo "ADDING RPM FUSION REPO"
sudo rpm -Uvh http://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm
sudo rpm -Uvh http://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm

echo "ADDING VS CODE REPO"
sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
sudo sh -c 'echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" > /etc/yum.repos.d/vscode.repo'

echo "CHECKING DNF"
dnf check-update

echo "INSTALLING APPS"
sudo dnf install -y chromium thunderbird code vlc gimp gnome-tweak-tool handbrake-gui ntfs-3g fuse-exfat f2*-backgrounds-gnome f2*-backgrounds-extras-gnome f3*-backgrounds-gnome f3*-backgrounds-extras-gnome python3-tools nodejs nano polari discord foliate

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
