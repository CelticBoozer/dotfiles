#!/bin/sh

# All needed packages installation.
cd ~
sudo pacman -S $(cat ~/.system-config-backup/pkglist.txt)
git clone https://aur.archlinux.org/paru.git
cd paru
makepkg -si
cd ..
rm -rf paru
paru -S $(cat ~/.system-config-backup/aurpkglist.txt)

# Zsh and oh-my-zsh installation and configuration.
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
cd ~/.oh-my-zsh/custom/plugins/
git clone git@github.com:zsh-users/zsh-autosuggestions.git
git clone git@github.com:zdharma-continuum/fast-syntax-highlighting.git
chsh --shell /bin/zsh

# Other submodules configuration.
git submodule update --init

