#!/bin/bash

sudo dnf update
sudo rpm -Uvh http://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm
sudo rpm -Uvh http://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
sudo sh -c 'echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" > /etc/yum.repos.d/vscode.repo'

dnf check-update
sudo dnf install -y thunderbird code vlc gimp gnome-tweak-tool kdenlive obs-studio handbrake ntfs-3g fuse-exfat python3-tools java-11-openjdk-devel nodejs php-cli php-mysqli transmission
sudo dnf install -y f2*-backgrounds-gnome f2*-backgrounds-extras-gnome f30-backgrounds-extras-gnome
