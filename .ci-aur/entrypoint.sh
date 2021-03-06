#!/bin/bash

pkgname=$1

useradd builder -m
echo "builder ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers
chmod -R a+rw .

# Enable the multilib repository
cat << EOM >> /etc/pacman.conf
[multilib]
Include = /etc/pacman.d/mirrorlist
EOM

cp /etc/pacman.conf /etc/pacman.conf.bak

cat << EOM >> /etc/pacman.conf
[archlinuxcn]
Server = https://repo.archlinuxcn.org/x86_64
EOM

pacman-key --init
pacman -Sy --noconfirm && pacman -S --noconfirm archlinuxcn-keyring
pacman -S --noconfirm yay

pacman -R archlinuxcn-keyring --noconfirm
cp /etc/pacman.conf.bak /etc/pacman.conf
pacman -Syu --noconfirm

# Install yay
#pacman -S --noconfirm --needed git
#git clone https://aur.archlinux.org/yay.git /tmp/yay
#pushd /tmp/yay
#chmod -R a+rw .
#sudo -H -u builder makepkg --skippgpcheck --syncdeps --install --noconfirm
#popd


sudo --set-home -u builder yay -S --noconfirm --builddir=./ "$pkgname"
