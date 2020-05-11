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



echo "INSTALLING PHP"
dnf install php -y


