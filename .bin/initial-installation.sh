#!/bin/sh

# All needed packages installation.
sudo pacman -S $(cat ../.system-config-backup/pkglist.txt)
cd ~
git clone git@github.com:Morganamilo/paru.git
cd paru
makepkg -si
cd ..
rm -rf paru
paru -S $(cat ../.system-config-backup/aurpkglist.txt)

# Zsh and oh-my-zsh installation and configuration.
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
cd .oh-my-zsh/custom/plugins/
git clone git@github.com:zsh-users/zsh-autosuggestions.git
git clone git@github.com:zdharma-continuum/fast-syntax-highlighting.git

# Other submodules configuration.
git submodule update --init

